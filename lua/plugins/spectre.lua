return {
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup()
    end,
    keys = {
      { "<leader/sr", false },
      { "<leader>sp", false },
      {
        "<leader>sw",
        "<cmd> lua require('grug-far').grug_far({ prefills = { search = vim.fn.expand('<cword>') } })<CR>",
        desc = "Search current word",
      },
    },
  },
}
