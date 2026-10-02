class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.7.0/ytgrab-1.7.0-darwin-arm64.tar.gz"
      sha256 "44883206f200c0684d2a5fbc0eabadd41b4ae0e8b7fbe9e41bb1cdff966bc414"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.7.0/ytgrab-1.7.0-darwin-amd64.tar.gz"
      sha256 "d98c00e6e80d22a314dc86247b6d57f6d61a69be5494008dc3de99aeb9a99a6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.7.0/ytgrab-1.7.0-linux-arm64.tar.gz"
      sha256 "3f21b63476bef238483483fb0a62f5bdfa150fbf11679dbf5fa1489584ac02d1"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.7.0/ytgrab-1.7.0-linux-amd64.tar.gz"
      sha256 "76dfc515fa788996568965f31286e6611b6207d0786e949309cda89933b7b083"
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
