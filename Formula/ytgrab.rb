class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.20.0/ytgrab-1.20.0-darwin-arm64.tar.gz"
      sha256 "ecbb929f2d426725add8bbd0ae2fe74e586bb2683f16e71e16e8f7298c0b6b9e"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.20.0/ytgrab-1.20.0-darwin-amd64.tar.gz"
      sha256 "223d6a5c237cdb87d77dc2e7382f7d30d0cf901ee54af1d635acb1bd84b52e79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.20.0/ytgrab-1.20.0-linux-arm64.tar.gz"
      sha256 "f3e92945ba04f2fce79c5fb90da27a8ef73242aa3913603825ab261e62ac92af"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.20.0/ytgrab-1.20.0-linux-amd64.tar.gz"
      sha256 "96efc2783fbd05f7ed4b0e484c71315458fff5bbe129f9ae201714b9fd4b35e6"
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
      Add YTGrab, with its icon, to Launchpad and Spotlight (macOS) or your
      applications menu (Linux); it then runs from the menu bar:
        ytgrab app
      yt-dlp comes from Homebrew; update it with:
        brew update && brew upgrade yt-dlp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ytgrab --version")
  end
end
