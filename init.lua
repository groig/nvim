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

if not vim.fn.has("gui_running") then
  require("vim._extui").enable({})
end

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
    map("n", "<leader>r", vim.lsp.buf.rename, opts)
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
  "lexical",
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
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/tzachar/highlight-undo.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/supermaven-inc/supermaven-nvim",
  "https://github.com/romainl/vim-qf",
})

map("n", "<F5>", vim.pack.update, { noremap = true })

autocmd("User", {
  pattern = "PackChanged",
  callback = function(args)
    local data = args.data
    if data.kind == "install" or data.kind == "update" then
      if data.spec.name == "blink.cmp" then
        vim.fn.system({ "cargo", "build", "--release" }, { cwd = data.path })
      elseif data.spec.name == "nvim-treesitter" then
        vim.defer_fn(function()
          vim.cmd("TSUpdate")
        end, 100)
      end
    end
  end,
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "cmake",
    "css",
    "csv",
    "diff",
    "dockerfile",
    "dot",
    "elixir",
    "elm",
    "erlang",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gpg",
    "graphql",
    "heex",
    "html",
    "htmldjango",
    "javascript",
    "jq",
    "json",
    "json5",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "po",
    "python",
    "php",
    "query",
    "regex",
    "robots",
    "sql",
    "ssh_config",
    "todotxt",
    "toml",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
    },
  },
})

-- blink.cmp
require("blink.cmp").setup({
  keymap = {
    ["<CR>"] = { "accept", "fallback" },
    ["<C-n>"] = { "show", "select_next" },
    ["<C-p>"] = { "show", "select_prev" },
  },
  cmdline = { enabled = false },
  completion = {
    menu = {
      draw = {
        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind", "source_name", gap = 1 } },
      },
    },
    documentation = { auto_show = true, auto_show_delay_ms = 100 },
  },
  signature = { enabled = true },
  appearance = { use_nvim_cmp_as_default = true },
})

-- fzf-lua
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

-- conform.nvim
map("n", "<leader><leader>", function()
  require("conform").format({ async = true })
end, { noremap = true })

require("conform").setup({
  formatters_by_ft = {
    css = { "prettier" },
    eelixir = { "rustywind", "mix" },
    elixir = { "rustywind", "mix" },
    go = { "gofmt" },
    heex = { "rustywind", "mix" },
    html = { "rustywind", "prettier" },
    htmldjango = { "djlint" },
    javascript = { "prettier" },
    json = { "jq" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "ruff_fix", "ruff_format" },
    sh = { "shfmt" },
    yaml = { "prettier" },
    cpp = { "astyle" },
    ["*"] = { "trim_whitespace" },
  },
  formatters = {
    djlint = {
      inherit = true,
      prepend_args = { "--profile", "django", "--indent", "2", "--indent-css", "2", "--indent-js", "2" },
    },
  },
  format_on_save = false,
})

-- gitsigns.nvim
require("gitsigns").setup({
  current_line_blame_opts = { delay = 0 },
})
local gitsigns = require("gitsigns")
map("n", "<leader>g", gitsigns.toggle_current_line_blame, {})
map("n", "<leader>gb", gitsigns.blame, {})
map("n", "<leader>gd", gitsigns.diffthis, {})

-- highlight-undo.nvim
require("highlight-undo").setup()
autocmd("TextYankPost", {
  pattern = "*",
  callback = function(opts)
    vim.highlight.on_yank({ higroup = "HighlightUndo", timeout = 200 })
  end,
})

-- mini.nvim
require("mini.cursorword").setup()
require("mini.indentscope").setup({
  symbol = "▏",
  draw = {
    animation = require("mini.indentscope").gen_animation.none(),
  },
})
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()
local gen_ai_spec = require("mini.extra").gen_ai_spec

-- supermaven-nvim
require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<C-h>",
    clear_suggestion = "<C-X>",
  },
  disable_inline_completion = false,
  disable_keymaps = false,
  log_level = "off",
})

-- vim-qf
vim.g["qf_mapping_ack_style"] = 1
vim.g["qf_statusline"] = {
  before = [[%<\ ]],
  after = [[\ %f%=%l\/%-6L\ \ \ \ \ ]],
}

map("n", "<C-k>", "<Plug>(qf_loc_previous)", { noremap = false })
map("n", "<C-j>", "<Plug>(qf_loc_next)", { noremap = false })
map("n", "<A-k>", "<Plug>(qf_qf_previous)", { noremap = false })
map("n", "<A-j>", "<Plug>(qf_qf_next)", { noremap = false })
