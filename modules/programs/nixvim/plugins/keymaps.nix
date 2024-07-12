{ ... }: {
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.keymaps = [

    { mode = "n"; key = "<leader>ff"; options.silent = true; action = "<cmd>Telescope find_files<CR>"; }
  ];
}
