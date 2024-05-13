return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  -- enabled = false,
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-h>",
        clear_suggestion = "<C-X>",
      },
    })
  end,
}
