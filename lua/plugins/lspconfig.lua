-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       lexical = {},
--     },
--     setup = {
--       lexical = function()
--         local lspconfig = require("lspconfig")
--         local configs = require("lspconfig.configs")
--
--         local lexical_config = {
--           filetypes = { "elixir", "eelixir", "heex" },
--           cmd = { "/Users/jakub/repos/opensource/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
--           settings = {},
--         }
--
--         if not configs.lexical then
--           configs.lexical = {
--             default_config = {
--               filetypes = lexical_config.filetypes,
--               cmd = lexical_config.cmd,
--               root_dir = function(fname)
--                 return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
--               end,
--               -- optional settings
--               settings = lexical_config.settings,
--             },
--           }
--         end
--
--         lspconfig.lexical.setup({})
--         return true
--       end,
--     },
--   },
-- }
return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      clangd = function()
        local local_cap = vim.lsp.protocol.make_client_capabilities()
        local util = require("lspconfig.util")
        local_cap.offsetEncoding = { "utf-16" }

        local root_files = {
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt",
          "build.sh", -- buildProject
          "configure.ac", -- AutoTools
          "run",
          "compile",
        }

        local opts = {
          cmd = {
            "clangd",
            "--all-scopes-completion",
            "--background-index",
            "--clang-tidy",
            "--compile_args_from=filesystem", -- lsp-> does not come from compie_commands.json
            "--completion-parse=always",
            "--completion-style=bundled",
            "--cross-file-rename",
            "--debug-origin",
            "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
            "--fallback-style=Qt",
            "--folding-ranges",
            "--function-arg-placeholders",
            "--header-insertion=iwyu",
            "--pch-storage=memory", -- could also be disk
            "--suggest-missing-includes",
            "-j=4", -- number of workers
            -- "--resource-dir="
            "--log=error",
            --[[ "--query-driver=/usr/bin/g++", ]]
          },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          root_dir = function(fname)
            return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
          end,
          single_file_support = true,
          init_options = {
            compilationDatabasePath = vim.fn.getcwd() .. "/build",
          },
          capabilities = local_cap,
          commands = {},
        }

        require("lspconfig").clangd.setup(opts)
      end,
    },
    opts = {
      autoformat = false,
    },
  },
  keys = {
    { "<leader>r", "<cmd> LspRestart <CR>", desc = "restart LSP server" },
  },
}
