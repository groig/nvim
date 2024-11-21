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
          draw = {
            columns = { { "kind_icon" }, { "label", "kind", gap = 1 } },
          },
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

      highlight = {
        ns = vim.api.nvim_create_namespace("blink_cmp"),
        use_nvim_cmp_as_default = true,
      },
    })
  end,
}
