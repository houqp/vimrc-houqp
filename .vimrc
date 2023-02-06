source ~/.vim/allrc.vim

set t_Co=256

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"colorscheme base16-eighties
" colorscheme freya-term
colorscheme gruvbox
set background=dark  " for gruvbox

set backspace=2



lua << EOF

-- Install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

if packer_bootstrap then
  require("packer").sync()
  return
end

-- Setup packer
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'simrat39/rust-tools.nvim'

   -- Autocompletion framework
  use("hrsh7th/nvim-cmp")
  use({
    -- cmp LSP completion
    "hrsh7th/cmp-nvim-lsp",
    -- cmp Snippet completion
    "hrsh7th/cmp-vsnip",
    -- cmp Path completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })
end)

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when lsp warnings/errors flow in
vim.wo.signcolumn = "yes"

local rt = require("rust-tools")
rt.setup({
  tools = {
    inlay_hints = {
      auto = true,
      only_current_line = true,
      right_align = false,
    },
  },
  server = {
    on_attach = function(_, bufnr)
      local keymap_opts = { buffer = buffer }
      -- Code navigation and shortcuts
      vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, keymap_opts)
      vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
      vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
      vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
    end,
  },
})

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.scroll_docs(-1),
    ["<C-j>"] = cmp.mapping.scroll_docs(1),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
})

EOF
