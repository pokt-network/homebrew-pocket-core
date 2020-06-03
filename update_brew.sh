#!/bin/bash
#Declare variables
POCKET_VERSION=$1
URL=https://github.com/pokt-network/pocket-core/archive/RC-$POCKET_VERSION.tar.gz

#Download and get the shasum256 value
curl $URL -o pocket.tar.gz
SHA_VALUE=$(shasum -a 256 pocket.tar.gz | awk -F' ' '{print $1}')

#Change the shasum256 value of the pocket formula
cat homebrew-pocket-core/pocket.rb | sed "s/sha256.*/sha256 \"$SHA_VALUE\"/" > trash.tst
echo "Adding $URL to the pocket.rb file"
cat trash.tst | sed "s,url.*,url \"$URL\"," > what.tst 

#Update the URL of the pocket-core tarfile
Updating