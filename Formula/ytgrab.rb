class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.5.0/ytgrab-1.5.0-darwin-arm64.tar.gz"
      sha256 "cf280d27b7667ec7b5942faa58b6f6c2eeeef0b6d8bd5de86a6b26b93fcdea69"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.5.0/ytgrab-1.5.0-darwin-amd64.tar.gz"
      sha256 "14d3ee38d124baa803733366857f38caed36ec0213f3f4f216ef639304a72e3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.5.0/ytgrab-1.5.0-linux-arm64.tar.gz"
      sha256 "4b39b7692b44dc128a83221c23a0b0a72e5ea0d98e528a5387348919076ae0b4"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.5.0/ytgrab-1.5.0-linux-amd64.tar.gz"
      sha256 "2c907bc4eb54487ad929ff16b346633d22530574a4fa13598cd50446f8855869"
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
