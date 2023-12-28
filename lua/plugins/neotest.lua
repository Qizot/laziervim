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
      { "<leader>nu", "<cmd> ElixirRunCurrentLineTest<CR>", desc = "Run elixir test under cursor" },
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

      vim.api.nvim_create_user_command("ElixirRunCurrentLineTest", function()
        local line = vim.api.nvim_get_current_line()

        local _, _, file, line_number = string.find(line, "(test/[%a_/]+%.exs):(%d+)")

        if file ~= nil and line ~= nil then
          local config = vim.api.nvim_win_get_config(0)
          if config.relative ~= "" then -- is_floating_window?
            vim.api.nvim_win_close(0, false) -- do not force
          end

          vim.lsp.util.jump_to_location({
            uri = "file:///" .. file,
            range = {
              start = { line = line_number, character = 0 },
              ["end"] = { line = line_number, character = 0 },
            },
          }, "utf-16", true)
        end
      end, {})
    end,
  },
}
