class Pocket < Formula
  desc "Official implementation of the Pocket Network Protocol"
  homepage "https://www.pokt.network"
  url "https://github.com/pokt-network/pocket-core/archive/RC-0.2.4.tar.gz"
  sha256 "d5b0e2e877870e7901eb1af49cb4be9bb44fc79229f36a5623d4eafd63deb708"
  depends_on "go" => :build
  depends_on "leveldb" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/pokt-network/pocket-core"
    # Copy all files from their current location (GOPATH root)
    # to $GOPATH/src/github.com/pokt-network/pocket-core
    bin_path.install Dir["*"]
    cd bin_path do
      # Install the compiled binary into Homebrew's `bin` - a pre-existing
      # global variable
      system "go", "mod", "vendor"
      system "go", "build", "-tags", "cleveldb", "-o", bin/"pocket", "./app/cmd/pocket_core/main.go"
    end
  end

  test do
    shell_output("#{bin}/pocket", "help")
  end
end
