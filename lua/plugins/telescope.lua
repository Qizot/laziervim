return {
  {
    "nvim-telescope/telescope.nvim",
    -- config = function()
    --   require("telescope").load_extension("project")
    -- end,
    keys = {
      { "<leadersw", false },
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
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          mappings = {
            n = {
              ["dd"] = "delete_buffer",
            },
          },
        },
      },
      extensions_list = { "project", "themes" },
    },
  },
  {

    "nvim-telescope/telescope-project.nvim",
    keys = {},
  },
}
