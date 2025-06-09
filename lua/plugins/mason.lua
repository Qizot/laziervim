return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "gofumpt",
      "goimports",
      "goimports-reviser",
      "gomodifytags",
      "gopls",
    },
  },
}
