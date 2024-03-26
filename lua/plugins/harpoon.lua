return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      { "<leader>ha", "<cmd> lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon add file" },
      { "<leader>hh", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon menu" },
      { "<leader>hn", "<cmd> lua require('harpoon.ui').nav_next()<CR>", desc = "Harpoon next file" },
      { "<leader>hp", "<cmd> lua require('harpoon.ui').nav_prev()<CR>", desc = "Harpoon previous file" },
    },
  },
}
