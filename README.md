# Homebrew Pocket-Core

Repository dedicated to host the formula to install the Pocket Core binary using brew.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Remember to always read the documentation available on [Pocket Documentation](https://docs.pokt.network/docs).

### Prerequisites

You should have brew install.

To install Homebrew on Mac:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

To install Homebrew on Linux:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

### Installing

To install Pocket-Core using brew just run those commands on the terminal of your system:

```
brew tap pokt-network/pocket-core
brew install pocket
```

And to start pocket core you can simply run:

```
pocket start
```

If everything works, a terminal prompt asking for a coinbase passphrase should appear.
