return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = {},
      },
    }, -- passed into config()
    config = function(_, opts)
      require("nvim-tree").setup(opts)
      -- other code you want to run with setting up nvim-tree
    end,
    keys = {
      { "<leader>n", "<cmd> NvimTreeToggle<CR>", desc = "   toggle nvimtree" },
      { "<leader>e", "<cmd> NvimTreeFocus<CR>", desc = "   focus nvimtree" },
    },
  },
}
