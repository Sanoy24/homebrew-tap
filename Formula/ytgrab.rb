class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.8.0/ytgrab-1.8.0-darwin-arm64.tar.gz"
      sha256 "b912fd0e4b8253aaa4368f0fbbbf9179eded667304c997b102a630379184ce48"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.8.0/ytgrab-1.8.0-darwin-amd64.tar.gz"
      sha256 "43ffb98d28ff5bdb064c99649d075d9bd716575b40acd849b4398dc3ce156e09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.8.0/ytgrab-1.8.0-linux-arm64.tar.gz"
      sha256 "3cf82379cec453824c10c372d564d860297498acbadecbc16594e9c88e4dc69b"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.8.0/ytgrab-1.8.0-linux-amd64.tar.gz"
      sha256 "af27047ec5873f273f7096b55d8e9efb81767d4962e61f562174ed866e08cf19"
    end
  end

  depends_on "deno"
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  def install
    bin.install "ytgrab"
  end

  def caveats
    <<~EOS
      Start YTGrab, which opens http://127.0.0.1:8787/ in your browser:
        ytgrab --open
      yt-dlp comes from Homebrew; update it with:
        brew upgrade yt-dlp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ytgrab --version")
  end
end
