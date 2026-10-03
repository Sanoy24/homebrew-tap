class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.12.0/ytgrab-1.12.0-darwin-arm64.tar.gz"
      sha256 "835a740385b558db0ccd9f073585d422495781a5581aac5d948f625bdf56e6a3"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.12.0/ytgrab-1.12.0-darwin-amd64.tar.gz"
      sha256 "c3fed9a0b0434c1b23a867819e8d6256527267367e2ae18163c26beabd871dce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.12.0/ytgrab-1.12.0-linux-arm64.tar.gz"
      sha256 "a6ca2236a094e432c0b2c003ebd22b4410a29b76864618980e45fcd2bc168ec6"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.12.0/ytgrab-1.12.0-linux-amd64.tar.gz"
      sha256 "4dd98b2faa1064cf2918a12353470c146879d835966dde63a7ea8118f42b0e36"
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
