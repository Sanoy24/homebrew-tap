class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.13.1/ytgrab-1.13.1-darwin-arm64.tar.gz"
      sha256 "6bad9e3b88e526e608a0d676e0c9b7b0e5c25128d60adef6af61fe2e9b87e61c"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.13.1/ytgrab-1.13.1-darwin-amd64.tar.gz"
      sha256 "804213cc5c2720b969c853470c74fe0905c931f0bab1a53415f11c7d862c5d94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.13.1/ytgrab-1.13.1-linux-arm64.tar.gz"
      sha256 "9b039ecbd9f5b71657a2a4725336f0eaadb6c9f292405795a44d4b7f9b4fe723"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.13.1/ytgrab-1.13.1-linux-amd64.tar.gz"
      sha256 "167bb010226e7e29823f0ffb9067f95599a0d6c57e455c1613687e60b814a8c4"
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
