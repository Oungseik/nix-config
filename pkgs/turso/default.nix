{
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage (finalAttrs: {
  pname = "turso";
  version = "0.5.3";

  src = pkgs.fetchFromGitHub {
    owner = "tursodatabase";
    repo = "turso";
    tag = "v${finalAttrs.version}";
    hash = "sha256-URYMX3t9VSkyF1ipZYaxtNU3dxmo88CWMj2mAxmcU9w=";
  };

  cargoHash = "sha256-Qff2ZyqqDSm+FI+kXVZC6TzIpl74cT6dztetnobIg0I=";

  cargoBuildFlags = [
    "-p"
    "turso_cli"
  ];
  cargoTestFlags = finalAttrs.cargoBuildFlags;

  meta = {
    description = "Interactive SQL shell for Turso";
    homepage = "https://github.com/tursodatabase/turso";
    license = pkgs.lib.licenses.mit;
    mainProgram = "tursodb";
  };
})
