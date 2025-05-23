return {
  "ibhagwan/fzf-lua",
  keys = {
    "<leader>p",
    "<leader>t",
    "<leader>b",
    "<leader>h",
  },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      defaults = { file_icons = "mini" },
      fzf_opts = { ["--layout"] = "default" },
      fzf_colors = true,
    })
    fzf.register_ui_select(function(_, items)
      local min_h, max_h = 0.15, 0.70
      local h = (#items + 4) / vim.o.lines
      if h < min_h then
        h = min_h
      elseif h > max_h then
        h = max_h
      end
      return { winopts = { height = h, width = 0.60, row = 0.40 } }
    end)

    local map = vim.keymap.set
    map("n", "<leader>p", fzf.files, { noremap = true })
    map("n", "<leader>t", function()
      fzf.tags({
        ctags_autogen = true,
        cmd = "ctags --excmd=combine --quiet -Rf -",
        fzf_opts = { ["--with-nth"] = "1,2" },
      })
    end, { noremap = true, silent = true })
    map("n", "<leader>b", fzf.buffers, { noremap = true })
    map("n", "<leader>h", fzf.helptags, { noremap = true })
  end,
}
