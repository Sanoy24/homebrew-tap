class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.16.0/ytgrab-1.16.0-darwin-arm64.tar.gz"
      sha256 "15f3d00fe8e294b53b66195c02728c7157482373d6f34ba04590c9f8706ebe40"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.16.0/ytgrab-1.16.0-darwin-amd64.tar.gz"
      sha256 "12a5808e61899e7fe94d40f9728eac1e9eeb07b58d03200f731fd6f7682533bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.16.0/ytgrab-1.16.0-linux-arm64.tar.gz"
      sha256 "f3b8b002be8af9c9f635c4f47845fe65387c9dd54a617a625f9f0c063172817c"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.16.0/ytgrab-1.16.0-linux-amd64.tar.gz"
      sha256 "1bb22eac3722dc17dbfeee100891fc260ab5460f9de9d44f31e15993d1ac298a"
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
