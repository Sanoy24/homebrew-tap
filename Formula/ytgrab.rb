class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.6.0/ytgrab-1.6.0-darwin-arm64.tar.gz"
      sha256 "47d0197b99f180b76a3f1e34d5bf7ab886ec9aa16cc7ad221c0bf8051db11a40"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.6.0/ytgrab-1.6.0-darwin-amd64.tar.gz"
      sha256 "a45dd7b84a1d18cf25aabb1e718f90b0084a2cb2a0ceec2427101642a75e54e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.6.0/ytgrab-1.6.0-linux-arm64.tar.gz"
      sha256 "02cba2c7216a8d302ec8a48386457b096fe0282db1b95e1fc5a8df510e1f156c"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.6.0/ytgrab-1.6.0-linux-amd64.tar.gz"
      sha256 "d47a19992fba5f343d359c06d6fde3be58a4c6423da0a0d52a02b43a9912b5ec"
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
