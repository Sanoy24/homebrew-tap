class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.11.0/ytgrab-1.11.0-darwin-arm64.tar.gz"
      sha256 "71315c3f1b4b9cc264942b20616ba57d821e94f2071051713b0f6f8919b1dc45"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.11.0/ytgrab-1.11.0-darwin-amd64.tar.gz"
      sha256 "e48bdb2c0ee8ea5043d0518cab7425cabaf73b05fa1adcfd274bec0a5a182d64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.11.0/ytgrab-1.11.0-linux-arm64.tar.gz"
      sha256 "da2e4b534a41ed92aa0adbe256f04fdc700e3d31f3f07475e3385d76cbc9a507"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.11.0/ytgrab-1.11.0-linux-amd64.tar.gz"
      sha256 "8ab708d7787c9fd7636edf6e3b90b52e5c16e71a0614f28323e4a5b5bb953d26"
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
