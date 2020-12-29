class Pocket < Formula
  desc "Official implementation of the Pocket Network Protocol"
  homepage "https://www.pokt.network"
<<<<<<< HEAD
  url "https://github.com/pokt-network/pocket-core/archive/RC-0.5.2.tar.gz"
  sha256 "bc1eecace4ec65afcc9f4e006abf91be54d32ecf29cfa78570de06c1e043a60f"
=======
  url "https://github.com/pokt-network/pocket-core/archive/RC-0.5.1.tar.gz"
  sha256 "5409250873668d913f78e7ec46e757cbec1bf362ee72820c298607b93b16a731"
>>>>>>> 766e2fb343ae2800334aa61b34c426c25a901fcb
  depends_on "go@1.13" => [:build, "1.13.15"]
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