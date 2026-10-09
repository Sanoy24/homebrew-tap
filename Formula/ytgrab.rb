class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.18.0/ytgrab-1.18.0-darwin-arm64.tar.gz"
      sha256 "8527a531ad8170a2d8e5abf4feabc9aeb65e0df84cbe8ff865fc278857f4011a"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.18.0/ytgrab-1.18.0-darwin-amd64.tar.gz"
      sha256 "e0571c031e362330a731e76041b55b452a2e3566ea706bed269c5c70c0f510a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.18.0/ytgrab-1.18.0-linux-arm64.tar.gz"
      sha256 "fe26e484464ae8536f48733513080fd6912794314d1494cbb5bf6b2335b1799f"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.18.0/ytgrab-1.18.0-linux-amd64.tar.gz"
      sha256 "e7ae21e86da55a5b6b85088a7b86a4d0d1eee847c0043ac68af912aa1901fc94"
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
        brew upgrade yt-dlp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ytgrab --version")
  end
end
