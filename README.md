# Homebrew Pocket-Core

Repository dedicated to host the formula to install the Pocket-Core binary using Homebrew.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Remember to always read the documentation available in the [Pocket Documentation](https://docs.pokt.network/docs).

### Prerequisites

You need to have the package manager Homebrew installed.

To install Homebrew on Mac or Linux, run the following command in a terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Installing

To install Pocket-Core using Homebrew just run the following commands in a terminal on your system:

```bash
brew tap pokt-network/pocket-core && \
brew install pocket
```

And to start Pocket-Core you can simply run:

```bash
pocket start
```

If everything works, a terminal prompt asking for a keybase passphrase, should appear.
