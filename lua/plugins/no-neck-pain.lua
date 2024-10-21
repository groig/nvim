return {
  "shortcuts/no-neck-pain.nvim",
  keys = {
    "<leader>n",
  },

  config = function()
    local nnp = require("no-neck-pain")
    nnp.setup({
      width = 180,
      buffers = {
        left = {
          scratchPad = {
            enabled = true,
            pathToFile = "./TODO.md",
          },
          bo = {
            filetype = "markdown",
          },
        },
        wo = {
          fillchars = "eob: ",
        },
      },
    })
    local map = vim.keymap.set
    map("n", "<leader>n", function()
      nnp.toggle()
    end, { noremap = true })
  end,
}
