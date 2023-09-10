return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").load_extension("project")
    end,
    keys = {
      { "<leader>ff", "<cmd> Telescope find_files <CR>", desc = "  find files" },
      { "<C-p>", "<cmd> Telescope find_files <CR>", desc = "  find files" },
      {
        "<leader>fa",
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
        desc = "  find all",
      },
      { "<leader>fg", "<cmd> Telescope live_grep <CR>", desc = "   live grep" },
      { "<leader>fw", "<cmd> Telescope grep_string <CR>", desc = "   find word" },
      { "<leader>fr", "<cmd> Telescope find_references <CR>", desc = "   find references" },
      { "<leader>fb", "<cmd> Telescope buffers <CR>", desc = "  find buffers" },
      { "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "  help page" },
      { "<leader>fo", "<cmd> Telescope oldfiles <CR>", desc = "   find oldfiles" },
      { "<leader>tk", "<cmd> Telescope keymaps <CR>", desc = "   show keys" },
      { "<leader>tp", "<cmd> Telescope project <CR>", desc = "   show projects" },
      { "<leader>tr", "<cmd> Telescope resume <CR>", desc = "   resume" },
      { "<leader>to", "<cmd> Telescope marks <CR>", desc = "   show marks" },
      { "<leader>ds", "<cmd> Telescope lsp_document_symbols <CR>", desc = "   document symbols" },

      -- git
      { "<leader>cm", "<cmd> Telescope git_commits <CR>", desc = "   git commits" },
      { "<leader>gt", "<cmd> Telescope git_status <CR>", desc = "  git status" },
      { "<leader>br", "<cmd> Telescope git_branches <CR>", desc = "  git branches" },

      -- theme switcher
      { "<leader>th", "<cmd> Telescope themes <CR>", desc = "   nvchad themes" },
      { "<leader>tb", "<cmd> Telescope builtin <CR>", desc = "   nvchad theme picker" },

      -- treesitter
      { "<leader>ts", "<cmd> Telescope treesitter<CR>", desc = " treesitter" },
    },
  },
  {

    "nvim-telescope/telescope-project.nvim",
    keys = {},
  },
}
