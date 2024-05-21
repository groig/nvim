return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.diff").setup({
      view = {
        signs = { add = "│", change = "~", delete = "-" },
        priority = 0,
      },
    })
    require("mini.pairs").setup()
    require("mini.notify").setup()
    require("mini.cursorword").setup()
    require("mini.git").setup()
    vim.keymap.set("n", "<leader>g", "<cmd>Git blame %<cr>", { noremap = true })
    require("mini.indentscope").setup({
      symbol = "▏",
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    })
  end,
  event = "BufReadPost",
}
