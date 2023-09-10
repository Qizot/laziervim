return {
  {
    "sindrets/diffview.nvim",
    lazy = false,
    after = "plenary.nvim",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          layout = {
            x = "diff3_mixed",
          },
        },
      })
    end,
    keys = {
      { "<leader>do", "<cmd> DiffviewOpen <CR>", desc = "open files diff browser" },
      { "<leader>dc", "<cmd> DiffviewClose <CR>", desc = "close files diff browser" },
      { "<leader>dh", "<cmd> DiffviewFileHistory <CR>", desc = "open file history" },
    },
  },
}
