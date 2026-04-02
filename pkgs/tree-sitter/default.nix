{ pkgs }:

let
  version = "0.26.8";
  src = pkgs.fetchurl {
    url = "https://github.com/tree-sitter/tree-sitter/releases/download/v${version}/tree-sitter-linux-x64.gz";
    hash = "sha256-l1SjKADwuXAVJ4LfF3tKR8cR405lGnrOs4TYvSn6E24=";
  };
in
pkgs.runCommand "tree-sitter-${version}"
  {
    nativeBuildInputs = [ pkgs.gzip ];
    meta = {
      description = "Parser generator tool and an incremental parsing library";
      homepage = "https://github.com/tree-sitter/tree-sitter";
      mainProgram = "tree-sitter";
      license = pkgs.lib.licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  }
  ''
    mkdir -p $out/bin
    gunzip -c ${src} > $out/bin/tree-sitter
    chmod +x $out/bin/tree-sitter
  ''
