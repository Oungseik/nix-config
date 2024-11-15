{ pkgs, ... }:
{
  services.picom = {
    package = pkgs.picom.overrideAttrs (oldAttrs: {
      src = pkgs.fetchFromGitHub {
        owner = "ibhagwan";
        repo = "picom";
        rev = "c4107bb6cc17773fdc6c48bb2e475ef957513c7a";
        hash = "sha256-1hVFBGo4Ieke2T9PqMur1w4D0bz/L3FAvfujY9Zergw=";
      };
    });

    backend = "glx";

    # activeOpacity = 1.0;
    # inactiveOpacity = 0.8;
    # fade = true;

  };
}
