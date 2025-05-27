collectgarbage("stop")

local set = vim.opt
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

jit.off()
autocmd("InsertEnter", {
  callback = function()
    jit.on()
    collectgarbage("restart")
  end,
  once = true,
})

local scheme = vim.fn.system({ "gsettings", "get", "org.gnome.desktop.interface", "color-scheme" })

if scheme == "'prefer-dark'\n" then
  vim.cmd.colorscheme("apprentice")
else
  vim.cmd.colorscheme("light")
end

vim.api.nvim_create_autocmd("TermResponse", {
  ---@diagnostic disable-next-line: unused-local
  callback = function(args)
    if vim.go.background == "light" then
      vim.cmd.colorscheme("light")
    elseif vim.go.background == "dark" then
      vim.cmd.colorscheme("apprentice")
    end
  end,
})

set.completeopt = "menu,menuone,noselect"
set.signcolumn = "yes"

-- moving around, searching and patterns
set.path = ".,**"
set.ignorecase = true
set.smartcase = true
set.conceallevel = 2

-- displaying text
set.scrolloff = 5
set.display = "truncate"
set.fillchars = { vert = "▏", horiz = "-", verthoriz = "+" }
set.list = true
set.listchars = {
  extends = "⟩",
  nbsp = "␣",
  precedes = "⟨",
  tab = "► ",
  trail = "·",
}

-- syntax, highlighting and spelling
set.termguicolors = true
set.cursorline = true

vim.g["neovide_cursor_animation_length"] = 0.05
vim.g["neovide_cursor_trail_size"] = 0.1
set.linespace = 2

-- multiple windows
set.statusline = " %f %{&modified?' +':''} %{&readonly?' ':''}%=  %3p%%"
set.previewheight = 5
set.splitbelow = true
set.splitright = true
set.splitkeep = "screen"
set.winborder = "rounded"

-- using the mouse
set.ruler = false
set.visualbell = true

-- selecting text
set.clipboard = "unnamedplus,unnamed"

-- editing text
set.undofile = true
set.textwidth = 80
set.formatoptions = "qrnj1"
set.formatlistpat =
  [[^\\s*[\\[({]\\\?\\([0-9]\\+\\\|[iIvVxXlLcCdDmM]\\+\\\|[a-zA-Z]\\)[\\]:.)}]\\s\\+\\\|^\\s*[-+o*]\\s\\+]]
set.complete = ".,w,b,u,t,i,k,kspell,s"
set.pumheight = 30
set.dictionary = { "/usr/share/dict/spanish", "/usr/share/dict/words" }

-- tabs and indenting
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

-- folding
set.foldlevel = 99
set.foldenable = false
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- diff mode
set.diffopt = "internal,algorithm:histogram,indent-heuristic,vertical"

-- mapping
set.timeoutlen = 400
set.ttimeoutlen = 50

-- reading and writing files
set.fileformats = "unix"
set.writebackup = false
set.autowrite = true

-- the swap file
set.swapfile = false

-- command line editing
set.wildmode = "longest:full,full"
set.wildignore:append("*.swp,*.bak")
set.wildignore:append("*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*,bundle.*")
set.wildignore:append("*/.git/**/*,*/.hg/**/*,*/.svn/**/*")
set.wildignore:append("*/min/*,*/vendor/*")
set.wildignore:append("*/node_modules/*,*/bower_components/*")
set.wildignore:append("*/java/*,*/target/*,*/out/*,*/_build/**/*")
set.wildignore:append("tags,cscope.*")
set.wildignore:append("*.tar.*")
set.wildignorecase = true

-- running make and jumping to errors
if vim.fn.executable("rg") then
  set.grepprg = "rg --vimgrep"
  set.grepformat = "%f:%l:%c:%m"
end

-- various
set.gdefault = true

-- mappings
vim.g.mapleader = " "

-- clear search highlights
map("n", "<leader>/", ":nohlsearch<cr>", { noremap = true })

-- remove trailing whitespaces and blank lines
map("n", "<leader>s", [[ mz:silent! %s/\s\+$//<cr>:let @/='' <CR>`z ]], { noremap = true })

-- edit config file
map("n", "<leader>v", ":e $XDG_CONFIG_HOME/nvim/init.lua<CR>", { noremap = true })

-- alternate byffers
map("n", "<BS>", ":b#<CR>", { silent = true })

-- F-# maps
-- spell
map("n", "<F8>", ":setlocal spell! spelllang=en_us<CR>", { noremap = true })
map("n", "<F9>", ":setlocal spell! spelllang=es<CR>", { noremap = true })

-- keep the center
map("n", "n", "nzz", { noremap = true })
map("n", "N", "Nzz", { noremap = true })
map("n", "*", "*zz", { noremap = true })
map("n", "#", "#zz", { noremap = true })

-- undo breakpoints
map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })
map("i", ")", ")<c-g>u", { noremap = true })

-- Substitute
map("n", "gs", ":%s/", { noremap = true })

-- [S]plit line (sister to [J]oin lines). cc still substitutes the line like S would
map("n", "S", "i<CR><Esc>", { noremap = true })

-- close other window
map("n", "<leader>c", ":wincmd p | q<CR>", { noremap = true, silent = true })

vim.cmd([[nmap <C-g> :file\|lua print(require'nvim-treesitter.statusline'.statusline({indicator_size=200}))<cr>]])

-- augroups
autocmd("BufReadPost", {
  pattern = "*",
  command = [[silent! normal! g`"zv]],
})

-- lsp config
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
    local opts = { noremap = true, silent = true, buffer = args.buf }
    map("n", "<leader>a", vim.lsp.buf.code_action, opts)
    map("n", "<leader>f", vim.lsp.buf.references, opts)
    map("n", "<leader>e", vim.diagnostic.open_float, opts)
    map("n", "<leader>l", vim.diagnostic.setloclist, opts)
    map("n", "<leader>d", function()
      vim.diagnostic.jump({ count = 1 })
    end, opts)
    map("n", "<leader>D", function()
      vim.diagnostic.jump({ count = -1 })
    end, opts)
  end,
})

vim.lsp.enable({
  "basedpyright",
  "lua_ls",
  "ruff",
  "ty",
  "ts_ls",
})

-- diagnostics
vim.diagnostic.config({
  virtual_lines = { current_line = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "● ",
      [vim.diagnostic.severity.WARN] = "● ",
      [vim.diagnostic.severity.INFO] = "● ",
      [vim.diagnostic.severity.HINT] = "● ",
    },
  },
  severity_sort = true,
  float = { source = "if_many", border = "rounded" },
})

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

map("n", "<F5>", "<cmd>Lazy sync<CR>", { noremap = true })

require("lazy").setup("plugins", {
  ui = { border = "single" },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
