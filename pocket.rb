class Pocket < Formula
  desc "Official implementation of the Pocket Network Protocol"
  homepage "https://www.pokt.network"
  url "https://github.com/pokt-network/pocket-core/archive/RC-0.4.2.tar.gz"
  sha256 "aceb9ca80b59e21200a66cf942c0edbaff6f5583430eca3d95c8a6aaa81ebe21"
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
