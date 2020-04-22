class Pocket < Formula
  desc "Official implementation of the Pocket Network Protocol"
  homepage "https://www.pokt.network"
  url "https://github.com/pokt-network/pocket-core/archive/RC-0.2.3.tar.gz"
  sha256 "1b2c0038ee9bf3a4e794cb5f2f0642c68c6f61a00f9f4f9dc354c35f5bb6ec5e"
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
