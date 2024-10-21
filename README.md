# Homebrew Pocket-Core <!-- omit in toc -->

Repository dedicated to host the formula to install the Pocket-Core binary using Homebrew.

## Getting Started

<<<<<<< HEAD
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Remember to always read the documentation available in the [Pocket Documentation](https://docs.pokt.network/docs).
=======
These instructions will get you a copy of the project up and running on your local
machine.

> > > > > > > 5ea4281 (Update docs)

Remember to always read the documentation available on [Pocket Documentation](https://docs.pokt.network/docs).

## Installation

### Homebrew

You need to have the package manager Homebrew installed.

To install Homebrew on Mac or Linux, run the following command in a terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Pocket

To install Pocket-Core using Homebrew just run the following commands in a terminal on your system:

```bash
brew tap pokt-network/pocket-core
brew install pocket
```

And to start Pocket-Core you can simply run:

```bash
pocket start
```

If everything works, a terminal prompt asking for a coinbase passphrase should appear.

## Development

### Update Formula

To update the formula, simply run the following command with the new version of the binary:

For example, to update to version RC-0.12.0:

```bash
./update_brew.sh RC-0.12.0
```
