class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.13.0/ytgrab-1.13.0-darwin-arm64.tar.gz"
      sha256 "db2be2fc143d79ce082289ec3d53af648b9878a4c3cd075be8c7bb497b90ccc2"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.13.0/ytgrab-1.13.0-darwin-amd64.tar.gz"
      sha256 "9d52d7c9f4ec306ce758d5a383825aff9aeaf9e16f065f2e4f7f26136632bbde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.13.0/ytgrab-1.13.0-linux-arm64.tar.gz"
      sha256 "4f6c492e24c0535f6fb61830a580d6608e3b43cda6129f1fcf1dcc59a19869f2"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.13.0/ytgrab-1.13.0-linux-amd64.tar.gz"
      sha256 "421c931a14e908f076fdc4526776ae160d34189e1003d0ce6b00989b77ca1bf5"
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
