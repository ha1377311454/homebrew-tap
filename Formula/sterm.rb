class Sterm < Formula
  desc "Terminal SSH connection manager with SFTP and themes"
  homepage "https://github.com/ha1377311454/sterm"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ha1377311454/sterm/releases/download/v0.1.1/sterm_darwin_arm64"
      sha256 "7f693a96bc378bdc3892341bb8d57fff9570598ae86cc4852d322150e46aaec1"
    end
    on_intel do
      url "https://github.com/ha1377311454/sterm/releases/download/v0.1.1/sterm_darwin_amd64"
      sha256 "dcdcac2f135cea459fab3ee2c63aaf7c309b231cbb8eeaa7e08edec6f24c714f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ha1377311454/sterm/releases/download/v0.1.1/sterm_linux_arm64"
      sha256 "94533f88d0b31c31bf26c1f5a492a03e4f605fa57c307a62e9ce6af9b42fd1c6"
    end
    on_intel do
      url "https://github.com/ha1377311454/sterm/releases/download/v0.1.1/sterm_linux_amd64"
      sha256 "fb745d0e157362c01aab5d8ee3d44a9a43c80907d85f1bfeddf732187bf8ca89"
    end
  end

  def install
    if OS.mac?
      bin.install (Hardware::CPU.arm? ? "sterm_darwin_arm64" : "sterm_darwin_amd64") => "sterm"
    elsif OS.linux?
      bin.install (Hardware::CPU.arm? ? "sterm_linux_arm64" : "sterm_linux_amd64") => "sterm"
    end
  end

  test do
    assert_match "SSH connection manager", shell_output("#{bin}/sterm --help", 2)
  end
end
