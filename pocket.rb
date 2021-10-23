class Pocket < Formula
  desc "Official implementation of the Pocket Network Protocol"
  homepage "https://www.pokt.network"
  url "https://github.com/pokt-network/pocket-core/archive/BETA-0.6.3.11.tar.gz"
  sha256 "9e549c8f1b796d256bf242d17622f05267723c19efec9fd57ae5f57ffb5385a2"
  depends_on "go@1.16" => [:build, "1.16.2"]
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
