return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  lazy = false,
  config = function()
    local kinds = {
      "Text",
      "Method",
      "Function",
      "Constructor",
      "Field",
      "Variable",
      "Property",
      "Class",
      "Interface",
      "Struct",
      "Module",
      "Unit",
      "Value",
      "Enum",
      "EnumMember",
      "Keyword",
      "Constant",
      "Snippet",
      "Color",
      "File",
      "Reference",
      "Folder",
      "Event",
      "Operator",
      "TypeParameter",
    }

    local icons = require("mini.icons")
    local kind_icons = {}
    for _, kind in ipairs(kinds) do
      kind_icons[kind] = icons.get("lsp", kind:lower())
    end
    require("blink.cmp").setup({
      keymap = {
        accept = "<CR>",
        show = "<C-n>",
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
      kind_icons = kind_icons,
    })
  end,
}
