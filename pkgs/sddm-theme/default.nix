# { stdenv, fetchFromGitHub }:
# {
#   sddm-sugar-dark = stdenv.mkDerivation rec {
#     pname = "sddm-sugar-dark-theme";
#     version = "1.2";
#     dontBuild = true;
#     installPhase = ''
#       mkdir -p $out/share/sddm/themes
#       cp -aR $src $out/share/sddm/themes/sugar-dark
#     '';
#     src = fetchFromGitHub {
#       owner = "MarianArlt";
#       repo = "sddm-sugar-dark";
#       rev = "v${version}";
#       sha256 = "0gx0am7vq1ywaw2rm1p015x90b75ccqxnb1sz3wy8yjl27v82yhb";
#     };
#   };
# }

# pkgs.stdenv.mkDerivation {
#   name = "sddm-theme";
#   src = pkgs.fetchFromGitHub {
#     owner = "MarianArlt";
#     repo = "sddm-sugar-dark";
#     rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
#     sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
#   };
#
#   installPhase = ''
#     mkdir -p $out
#     cp -R ./* $out
#     cd $out
#     rm Background.jpg
#     cp -r ${./wallpapers/painting-mountain-lake-with-mountain-background.jpg} $out/Background.jpg
#   '';
# }

{ }: { }
