{ ... }:
{
  programs.zathura = {
    enable = true;
    mappings = {
      "[normal] <C-=>" = "zoom in";
      "[normal] <C-->" = "zoom out";
    };
    options = import ./theme/catppuccin-frappe.nix;
    extraConfig = '''';
  };
}
