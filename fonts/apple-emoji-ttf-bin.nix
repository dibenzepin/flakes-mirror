{ stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "apple-emoji-ttf-bin";
  version = "macos-26-20260218-d5729b24";
  dontUnpack = true;

  src = fetchurl {
    url = "https://github.com/samuelngs/apple-emoji-ttf/releases/download/${version}/AppleColorEmoji-Linux.ttf";
    hash = "sha256-TvX+SNSkD+cuikrRoJR+GdT+oH1P6Xh+ufZf4YZQRoA=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/truetype
    cp $src $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = {
    description = "A derivation for the Apple Color Emoji font from GitHub Releases";
  };
}
