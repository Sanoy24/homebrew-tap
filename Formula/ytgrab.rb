class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.10.0/ytgrab-1.10.0-darwin-arm64.tar.gz"
      sha256 "3e0088cf6b762af5a64970d2f6cd8fef2dbcaed273924b5117005e51cefa9c34"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.10.0/ytgrab-1.10.0-darwin-amd64.tar.gz"
      sha256 "6791a00e1cd220fcb024eb64035c323df4c0439f70b0469f5e97f7064f32a949"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.10.0/ytgrab-1.10.0-linux-arm64.tar.gz"
      sha256 "65dbe24f9e07be4a62f3077ecabfc5e48bae4f3dd05df8450bb6ddaad73ae96c"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.10.0/ytgrab-1.10.0-linux-amd64.tar.gz"
      sha256 "51a8bf308985c08763c82caff34405235928ded13f5e936721a55069fad4c779"
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
