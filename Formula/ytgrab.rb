class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.22.0/ytgrab-1.22.0-darwin-arm64.tar.gz"
      sha256 "1faa87a1e55fe4c674034dd56d7f30a1ad2d3b235515c41146edd64ec9b2ca77"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.22.0/ytgrab-1.22.0-darwin-amd64.tar.gz"
      sha256 "b33db7ff90bcb08c484722c171d833d7b4f84d7045eaf70e76f1d64a4fefe431"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.22.0/ytgrab-1.22.0-linux-arm64.tar.gz"
      sha256 "a87b379214262058237da9904e79f0ebfe67792c2b2384090eb74464cbc41743"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.22.0/ytgrab-1.22.0-linux-amd64.tar.gz"
      sha256 "a4e3966c53c7ff0291beb8e5f6da5b60338d9dfd896dc79708201ba16c6d0886"
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
