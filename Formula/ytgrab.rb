class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.19.0/ytgrab-1.19.0-darwin-arm64.tar.gz"
      sha256 "82a34ed9496775f19478fa29eff970644081d77c2ae425a9f8e905d94795de94"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.19.0/ytgrab-1.19.0-darwin-amd64.tar.gz"
      sha256 "fdf029b87366dc5b8a73f46ddec832ecab20d429915bac5552e0eb8ae813f88f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.19.0/ytgrab-1.19.0-linux-arm64.tar.gz"
      sha256 "fcc995d7bd081bcbfc979638babb501355fbfe4e7b1054db4337b4b14ab13e87"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.19.0/ytgrab-1.19.0-linux-amd64.tar.gz"
      sha256 "65ae6792570f5f6463c2fe54024f56c0b9aba3ad447e151a963cd6626e09472a"
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
