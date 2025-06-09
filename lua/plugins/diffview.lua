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
      { "<leader>vo", "<cmd> DiffviewOpen <CR>", desc = "open files diff browser" },
      { "<leader>vc", "<cmd> DiffviewClose <CR>", desc = "close files diff browser" },
    },
  },
}
