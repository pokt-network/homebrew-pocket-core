#!/bin/bash
# exit when any command fails
set -e

#Verify that the pocket version is correctly sent
if [ $# -eq 0 ]; then
    echo "Example usage: ./update_brew.sh 0.4.0"
    exit 1
fi

#Declare variables
POCKET_VERSION=$1
URL=https://github.com/pokt-network/pocket-core/archive/RC-$POCKET_VERSION.tar.gz

#Verify formula file truly exist
if [ -f pocket.rb ]; then
    #Download and get the shasum256 value
    echo "Downloading pocket.tar.gz version $POCKET_VERSION"
    curl $URL -sL -o pocket.tar.gz
    # Get the shasum 256 value of the pocket.tar.gz file
    echo "Calculating pocket.tar.gz file sha256 value"
    SHA_VALUE=$(shasum -a 256 pocket.tar.gz | awk -F' ' '{print $1}')

    #Change the shasum256 value of the pocket formula file    
    echo "Adding sha256 ($SHA_VALUE) value calculated from pocket.tar.gz to pocket.rb file"
    cat pocket.rb | sed "s/sha256.*/sha256 \"$SHA_VALUE\"/" > trash.tst
    
    #Change the url value of the pocket formula file
    echo "Adding $URL to the pocket.rb file"
    cat trash.tst | sed "s,url.*,url \"$URL\"," > pocket.rb

    #Clean the directory
    echo "Cleaning directory..."
    rm pocket.tar.gz trash.tst 
    echo "Done!"
else 
    echo "pocket.rb not found. Please verify the script is running in homebrew-pocket-core root folder"
    exit 1
fi