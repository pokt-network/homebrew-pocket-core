# Homebrew Pocket-Core

Repository dedicated to host the formula to install the Pocket-Core binary using Homebrew.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Remember to always read the documentation available in the [Pocket Documentation](https://docs.pokt.network/docs).

### Prerequisites

You need to have the package manager Homebrew installed.

To install Homebrew on Mac:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

To install Homebrew on Linux:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

### Installing

To install Pocket-Core using Homebrew just run the following commands on the terminal of your system:

```bash
brew tap pokt-network/pocket-core && \
brew install pocket
```

And to start Pocket-Core you can simply run:

```bash
pocket start
```

If everything works, a terminal prompt asking for a coinbase passphrase should appear.
