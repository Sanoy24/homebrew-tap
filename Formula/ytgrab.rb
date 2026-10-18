class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.23.0/ytgrab-1.23.0-darwin-arm64.tar.gz"
      sha256 "fdd5aeb69cb16a6595c3e8b3c3aae630232cb3b1f22c4a79a6d7b8cb4b86ef43"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.23.0/ytgrab-1.23.0-darwin-amd64.tar.gz"
      sha256 "21f545e8f949c8794c3c8ba28b837590bafb6b4dc1259d0dba1ee67fed305b3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.23.0/ytgrab-1.23.0-linux-arm64.tar.gz"
      sha256 "f82f9da88f8564189cb56250218acda1e03a8bb3abe741cbca407a59b9aabcff"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.23.0/ytgrab-1.23.0-linux-amd64.tar.gz"
      sha256 "2483c3edd7128edc377065b4d69502cc842b1ccc4d8a9eb85e3385bb34255a5a"
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
