return {

  { "jfpedroza/neotest-elixir" },
  { "nvim-neotest/neotest-python" },
  { "nvim-neotest/neotest-go" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-go",
    },
    adapters = {
      "nvim-neotest/neotest",
    },
    keys = {
      { "<leader>nt", "<cmd> lua require('neotest').run.run()<CR>", desc = "Run nearest test" },
      {
        "<leader>nf",
        "<cmd> lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
        desc = "Run tests for current file",
      },
      {
        "<leader>to",
        "<cmd> lua require('neotest').output.open({ enter = true })<CR>",
        desc = "Open test output",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-elixir"),
          require("neotest-go"),
        },
        consumers = {
          overseer = require("neotest.consumers.overseer"),
        },
        quickfix = {
          enabled = false,
          open = function()
            vim.cmd("Trouble quickfix")
          end,
        },
      })
    end,
  },
}
