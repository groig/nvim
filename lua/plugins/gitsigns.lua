return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  config = function()
    require("gitsigns").setup({
      current_line_blame_opts = {
        delay = 0,
      },
    })
    local gitsigns = require("gitsigns")
    vim.keymap.set("n", "<leader>g", gitsigns.toggle_current_line_blame, {})
    vim.keymap.set("n", "<leader>d", gitsigns.diffthis, {})
  end,
}
