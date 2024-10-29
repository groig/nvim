return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  lazy = false,
  config = function()
    require("blink.cmp").setup({
      keymap = {
        ["<CR>"] = { "select_and_accept" },
        ["<C-n>"] = { "show", "select_next" },
        ["<C-p>"] = { "show", "select_prev" },
        ["<C-e>"] = { "hide" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      accept = {
        auto_brackets = { enabled = true },
      },
      trigger = {
        signature_help = {
          enabled = true,
        },
      },
      fuzzy = {
        keyword_range = "full",
        use_typo_resistance = false,
      },
      windows = {
        autocomplete = {
          border = "single",
          selection = "auto_insert",
          draw = function(ctx)
            return {
              " ",
              {
                ctx.kind_icon,
                ctx.icon_gap,
                ctx.item.label,
                ctx.kind == "Snippet" and "~" or nil,
                fill = true,
                hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
                max_width = 50,
              },
              " ",
              { ctx.kind, hl_group = "BlinkCmpKind" .. ctx.kind },
              " ",
            }
          end,
        },
        documentation = {
          border = "single",
          auto_show = true,
          auto_show_delay_ms = 100,
          update_delay_ms = 100,
        },
        signature_help = {
          border = "single",
        },
      },
    })
  end,
}
