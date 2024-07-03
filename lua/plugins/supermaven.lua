return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-h>",
        clear_suggestion = "<C-X>",
      },
      disable_inline_completion = true,
      disable_keymaps = true,
      log_level = "off",
    })
  end,
}
