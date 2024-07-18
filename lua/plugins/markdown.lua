return {
  "MeanderingProgrammer/markdown.nvim",
  event = "BufReadPost",
  config = function()
    require("render-markdown").setup({})
  end,
}
