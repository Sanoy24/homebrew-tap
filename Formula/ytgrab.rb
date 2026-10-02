class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.9.0/ytgrab-1.9.0-darwin-arm64.tar.gz"
      sha256 "cc430b7edaea0b98e04dcaf5f0ad157d267c097e18d9b4fab05a79e33aa1a867"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.9.0/ytgrab-1.9.0-darwin-amd64.tar.gz"
      sha256 "1f48a97e9fc79fb208be94727d23821e44305bfbb285d9f01a52c7dfae55aadf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.9.0/ytgrab-1.9.0-linux-arm64.tar.gz"
      sha256 "ac33572d6f4a61c293062a089add2352e07975e190d4a8721774339ef99ec9bc"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.9.0/ytgrab-1.9.0-linux-amd64.tar.gz"
      sha256 "868ffe824a732fc07e637293eec6277eb94979c797a4b61aa4951ff53206f355"
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
