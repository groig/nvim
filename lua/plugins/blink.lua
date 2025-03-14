return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  event = "InsertEnter",
  config = function()
    require("blink.cmp").setup({
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
        ["<C-n>"] = { "show", "select_next" },
        ["<C-p>"] = { "show", "select_prev" },
      },
      cmdline = {
        enabled = false,
      },
      completion = {
        menu = {
          border = "single",
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind", "source_name", gap = 1 } },
          },
        },
        documentation = {
          window = {
            border = "single",
          },
          auto_show = true,
          auto_show_delay_ms = 100,
        },
      },
      signature = {
        window = {
          border = "single",
        },
        enabled = true,
      },
      appearance = {
        use_nvim_cmp_as_default = true,
      },
    })
  end,
}
