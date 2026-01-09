{ pkgs, ... }:
let
  plugins-repo = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "68f7d4898c19dcf50beda251f8143992c3e8371f";
    hash = "sha256-6iA/C0dzbLPkEDbdEs8oAnVfG6W+L8/dYyjTuO5euOw=";
  };
  starship = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "eca186171c5f2011ce62712f95f699308251c749";
    sha256 = "sha256-xcz2+zepICZ3ji0Hm0SSUBSaEpabWUrIdG7JmxUl/ts=";
  };
  yamb = pkgs.fetchFromGitHub {
    owner = "h-hg";
    repo = "yamb.yazi";
    rev = "5f2e22e784dd5fc830cd85885a6d1d6690b52298";
    hash = "sha256-3Cp3+v0laSVsDdTyG26EOh2xt18ER8P9Nla9vtRuj9k=";
  };
in
{

  programs.yazi = {
    enableZshIntegration = true;

    settings = {
      mgr = {
        show_hidden = false;
      };
      # preview = {
      # max_width = 1000;
      # max_height = 1000;
      # };
    };

    theme = import ./themes/catppuccin.nix;

    plugins = {
      inherit starship;
      inherit yamb;
      full-border = "${plugins-repo}/full-border.yazi";
    };

    keymap = {
      mgr.prepend_keymap = import ./keymaps/yamb.nix;
    };

    initLua = ''
      require("starship"):setup()
      require("full-border"):setup {
      	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
      	type = ui.Border.ROUNDED,
      }

      -- You can configure your bookmarks by lua language
      local bookmarks = {}

      local path_sep = package.config:sub(1, 1)
      local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
      if ya.target_family() == "windows" then
        table.insert(bookmarks, {
          tag = "Scoop Local",
          
          path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
          key = "p"
        })
        table.insert(bookmarks, {
          tag = "Scoop Global",
          path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
          key = "P"
        })
      end
      table.insert(bookmarks, {
        tag = "Desktop",
        path = home_path .. path_sep .. "Desktop" .. path_sep,
        key = "d"
      })

      require("yamb"):setup {
        -- Optional, the path ending with path seperator represents folder.
        bookmarks = bookmarks,
        -- Optional, recieve notification everytime you jump.
        jump_notify = true,
        -- Optional, the cli of fzf.
        cli = "fzf",
        -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
        keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
        -- Optional, the path of bookmarks
        path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
              (os.getenv("HOME") .. "/.config/yazi/bookmark"),
      }
    '';
  };
}
