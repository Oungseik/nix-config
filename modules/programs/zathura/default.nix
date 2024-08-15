{ pkgs, ... }: {
  programs.zathura = {
    enable = true;
    mappings = {
      "[normal] <C-i>" = "zoom in";
      "[normal] <C-o>" = "zoom out";
      "[normal] <C-=>" = "zoom in";
      "[normal] <C-->" = "zoom out";
    };
    options = import ./theme/catppuccin-frappe.nix;
    extraConfig = '''';
  };
}
