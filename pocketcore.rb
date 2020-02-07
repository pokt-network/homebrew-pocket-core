class Pocketcore < Formula
  desc "Official implementation of the Pocket Network Protocol"
  homepage "https://www.pokt.network"
  sha256 "d1d5e05e0b295edb463325278b77c0884077e8ff830e6488a6b9ad61ba4dd473"
  head "https://github.com/pokt-network/pocket-core.git", :branch => "staging"
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
    shell_output("#{bin}/pocketcore", "start")
  end
end
