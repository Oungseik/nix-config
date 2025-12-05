{ pkgs, ... }:
{

  system.stateVersion = "25.11";
  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [
    22
    80
    443
  ];

  users.users.root = {
    password = "root";
  };

  environment.systemPackages = with pkgs; [
    curl
    fastfetch
    htop
    jq
    nvd
    screen
    tmux
  ];

  ## Enable `git` program:
  programs.git = {
    enable = true;
  };

  ## Enable `neovim` program:
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };

}
