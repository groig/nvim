return {
  "saghen/blink.cmp",
  -- enabled = false,
  event = "InsertEnter",
  build = "cargo build --release",
  opts = {
    keymap = {
      accept = "<CR>",
    },
    trigger = {
      signature_help = {
        enabled = true,
      },
    },

    windows = {
      autocomplete = {
        border = "single",
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
  },
}
