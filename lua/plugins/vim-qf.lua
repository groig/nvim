local map = vim.keymap.set
return {
  {
    "romainl/vim-qf",
    event = "CmdlineEnter",
    config = function()
      vim.g["qf_mapping_ack_style"] = 1
      vim.g["qf_statusline"] = {
        before = [[%<\ ]],
        after = [[\ %f%=%l\/%-6L\ \ \ \ \ ]],
      }
      map("n", "<C-k>", "<Plug>(qf_loc_previous)", { noremap = false })
      map("n", "<C-j>", "<Plug>(qf_loc_next)", { noremap = false })
      map("n", "<A-k>", "<Plug>(qf_qf_previous)", { noremap = false })
      map("n", "<A-j>", "<Plug>(qf_qf_next)", { noremap = false })
    end,
  },
}
