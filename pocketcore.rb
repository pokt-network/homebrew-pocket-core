class Pocketcore < Formula
  desc "Official implementation of the Pocket Network Protocol"
  homepage "https://www.pokt.network"
  url "https://github.com/pokt-network/pocket-core/archive/RC-0.0.1.tar.gz"
  sha256 "c6ed5588c50d5eb76f32718625e7e69dd19ed3a14b84905ce4c2748ad502fbfc"
  depends_on "go" => :build

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
      system "go", "build", "-o", bin/"pocket-core", "./app/cmd/pocket_core/main.go"
    end
  end

  test do
    shell_output("#{bin}/pocket-core", "help")
  end
end
