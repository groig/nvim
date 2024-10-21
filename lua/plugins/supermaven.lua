return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-h>",
        clear_suggestion = "<C-X>",
      },
      disable_inline_completion = false,
      disable_keymaps = false,
      log_level = "off",
    })
  end,
}
