return {
  {
    "stevearc/overseer.nvim",
    lazy = false,
    config = function()
      require("overseer").setup({
        templates = {
          "builtin",
        },
        component_aliases = {
          default_neotest = {
            "on_output_summarize",
            "on_exit_set_status",
            "on_complete_notify",
            "on_complete_dispose",
          },
        },
      })

      vim.api.nvim_create_user_command("OverseerRestartTask", function()
        local sidebar = require("overseer.task_list.sidebar").get()
        local task = sidebar:_get_task_from_line()
        if task then
          task:restart()
        end
      end, {})
    end,
    keys = {
      { "<leader>oo", "<cmd> OverseerRun<CR>", desc = "Run overseer" },
      { "<leader>ot", "<cmd> OverseerToggle<CR>", desc = "Toggle overseer" },
      { "<leader>or", "<cmd> OverseerRestartTask<CR>", desc = "Restart overseer from task list" },
    },
  },
}
