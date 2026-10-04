class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.15.0/ytgrab-1.15.0-darwin-arm64.tar.gz"
      sha256 "64fab45b92cb3b72c75743f1cd2a17482441596489da74168f97b694c6903f04"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.15.0/ytgrab-1.15.0-darwin-amd64.tar.gz"
      sha256 "d6a23deec45d263e28289fd91b2ad27e3f8ad187f74531af6f41f455c071a501"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.15.0/ytgrab-1.15.0-linux-arm64.tar.gz"
      sha256 "ad417a1d5e96d533e0ad0a8307a869474c65235b6787b6bb87ecbc89517c8f2b"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.15.0/ytgrab-1.15.0-linux-amd64.tar.gz"
      sha256 "216dae2180a6396c36d5b0db5ba752290de9e321ec80855c09bf6c3df097d706"
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
