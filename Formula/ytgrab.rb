class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.14.0/ytgrab-1.14.0-darwin-arm64.tar.gz"
      sha256 "65b246a000790580a0099c72b8c7984758ee16cea0d67826cf85b1bee49cba0d"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.14.0/ytgrab-1.14.0-darwin-amd64.tar.gz"
      sha256 "7df32ba8f16d0dff8767dbc8669cf2289a5082ae6a1b557fef79598bccda9956"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.14.0/ytgrab-1.14.0-linux-arm64.tar.gz"
      sha256 "c7ce1eb036dd7846b69280461c331737d907ab4db683fe9b6ca84083df1de32d"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.14.0/ytgrab-1.14.0-linux-amd64.tar.gz"
      sha256 "fb5057f73f51abef5dfcce7ef50ca09e0b0b7926e5f3e13f0fa514e358f5d0b5"
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
