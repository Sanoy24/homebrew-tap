class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.21.0/ytgrab-1.21.0-darwin-arm64.tar.gz"
      sha256 "68f85f01d24accc256e4b7eb95412ba7508cbf319e8d8319c629b65ed545ddaf"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.21.0/ytgrab-1.21.0-darwin-amd64.tar.gz"
      sha256 "7d9d7bd57700c1ac91a15de792e785ab9e9a70274d87d2b92cbe9fcd35bd374f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.21.0/ytgrab-1.21.0-linux-arm64.tar.gz"
      sha256 "00b2b8bee61efd2401d9c6f1d09d589122220cfe9bf90cbd5b39134ebfc159f1"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.21.0/ytgrab-1.21.0-linux-amd64.tar.gz"
      sha256 "2a48e99222d328f7ac2ad6264802fddec7e94ce58035e8b90272d9bb42709de1"
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
