return {
  "tzachar/highlight-undo.nvim",
  config = function()
    require("highlight-undo").setup()
    vim.api.nvim_create_autocmd("TextYankPost", {
      pattern = "*",
      callback = function(opts)
        vim.highlight.on_yank({ higroup = "HighlightUndo", timeout = 200 })
      end,
    })
  end,
  keys = {
    {
      "u",
      desc = "undo",
    },
    {
      "<C-r>",
      desc = "redo",
    },
    {
      "y",
      desc = "yak",
      mode = "v",
    },
    {
      "Y",
      desc = "yak",
      mode = "v",
    },
  },
}
