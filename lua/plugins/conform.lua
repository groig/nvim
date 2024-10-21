return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader><leader>",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      eelixir = { "rustywind", "mix" },
      elixir = { "rustywind", "mix" },
      go = { "gofmt" },
      heex = { "rustywind", "mix" },
      html = { "rustywind", "prettier" },
      htmldjango = { "djlint" },
      javascript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "ruff_fix", "ruff_format" },
      sh = { "shfmt" },
      yaml = { "prettier" },
      ["*"] = { "trim_whitespace" },
    },
    formatters = {
      djlint = {
        inherit = true,
        prepend_args = { "--profile", "django", "--indent", "2", "--indent-css", "2", "--indent-js", "2" },
      },
    },
    format_on_save = false,
  },
}
