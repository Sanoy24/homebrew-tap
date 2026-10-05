class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.17.0/ytgrab-1.17.0-darwin-arm64.tar.gz"
      sha256 "86f85ff4845e780a387d604cbac4058e89ff63ca9f33a0a20fe4e06a20b5dabd"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.17.0/ytgrab-1.17.0-darwin-amd64.tar.gz"
      sha256 "302599ba947bbb8006712b0d41b522d304a706298ab436753363b126cdfc4e78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.17.0/ytgrab-1.17.0-linux-arm64.tar.gz"
      sha256 "464a74eda00b3628d11ea6985bd601c86888ef80acfb14059442c9db2bb82231"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.17.0/ytgrab-1.17.0-linux-amd64.tar.gz"
      sha256 "c0014094252cfa25eb5727da2610bdc67dcb399754770ec9de25a770802eea13"
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
