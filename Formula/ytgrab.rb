class Ytgrab < Formula
  desc "Local YouTube downloader with a browser interface"
  homepage "https://github.com/Sanoy24/ytgrab"
  version "1.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.16.1/ytgrab-1.16.1-darwin-arm64.tar.gz"
      sha256 "c8e4c52f2f1351d77318e014397538f23c6e8443ad16e1e242d389b48ba70a10"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.16.1/ytgrab-1.16.1-darwin-amd64.tar.gz"
      sha256 "0bbf130d4a491b511a0cd1a560a1715757a7284fc3657b5e518a6fe7a0df4f28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.16.1/ytgrab-1.16.1-linux-arm64.tar.gz"
      sha256 "db972b73c9f08cb79bf7e6152c2cd7a8847e5cbc3b4ecdea6f3d0de1c7cfc215"
    end
    on_intel do
      url "https://github.com/Sanoy24/ytgrab/releases/download/v1.16.1/ytgrab-1.16.1-linux-amd64.tar.gz"
      sha256 "c0830c779c02ab6889c09a4c4ec88563796016ac768042fe4e15f8e25270cf06"
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
