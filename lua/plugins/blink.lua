return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  event = "InsertEnter",
  config = function()
    require("blink.cmp").setup({
      keymap = {
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-n>"] = { "show", "select_next" },
        ["<C-p>"] = { "show", "select_prev" },
        ["<C-e>"] = { "hide" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      completion = {
        keyword = {
          range = "full",
        },
        trigger = {
          show_in_snippet = false,
        },
        list = {
          max_items = 10,
          selection = "auto_insert",
        },
        menu = {
          border = "single",
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind", "source_name", gap = 1 } },
            treesitter = { "lsp" },
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
      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
        providers = {
          snippets = {
            score_offset = 1,
          },
        },
        cmdline = {},
      },
      appearance = {
        use_nvim_cmp_as_default = true,
      },
    })
  end,
}
