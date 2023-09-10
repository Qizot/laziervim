return {
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup()
    end,
    keys = {
      { "<leader/sr", false },
      { "<leader>sp", "<cmd> lua require('spectre').toggle()<CR>", desc = "Toggle spectre" },
      {
        "<leader>sw",
        "<cmd> lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "Search current word",
      },
    },
  },
}
