-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup({
  ----------------
  -- languages ---
  ----------------
  {
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    config = function()
      local lspconfig = require("lspconfig")

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          -- Press `K` in normal mode to show LSP over for type info
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
        end,
      })

      local on_attach = function(client, bufnr)
        -- format on save
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({ async = false }) end
          })
        end
      end

      lspconfig.tsserver.setup {
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" }
      }

      lspconfig.pyright.setup {}
    end,
  },

  -- rust related
  {"rust-lang/rust.vim", ft = {"rs", "rust"}},
  {"racer-rust/vim-racer", ft = {"rs", "rust"}},
  {
    'simrat39/rust-tools.nvim',
    ft = {"rs", "rust"},
    config = function()
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
    end,
  },

  {"fatih/vim-go", ft = "go"},
  {"tfnico/vim-gradle", ft = "gradle"},
  {"euclio/vim-markdown-composer", ft = {"md", "markdown"}, build = "cargo build --release --locked"},
  {"hashivim/vim-terraform", ft = {"tf", "terraform"}}, -- for auto format on save
  {"zchee/vim-flatbuffers", ft = "fbs"},

  -- web dev
  {"mattn/emmet-vim", ft = "html" },
  {"tpope/vim-haml", ft = "haml" },

  -- Autocompletion framework
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    dependencies = {
      -- cmp LSP completion
      "hrsh7th/cmp-nvim-lsp",
      -- cmp Snippet completion
      "hrsh7th/cmp-vsnip",
      -- cmp Path completion
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    config = function()
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
    end,
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  -- dev tools ---
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
  { 
    "tomtom/tcomment_vim", -- for fast comment/uncomment
    keys = {"v"},  -- load plugin when we start visual selection
  },
  "editorconfig/editorconfig-vim",
  {"norcalli/nvim-colorizer.lua", event = "VeryLazy"},  -- hight RBG code by color
  {"tpope/vim-unimpaired", event = "VeryLazy"},
  {"tpope/vim-repeat", event = "VeryLazy"},
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  {
    "bronson/vim-trailing-whitespace",
    event = "VeryLazy",
  },
  {"rhysd/vim-grammarous", ft = "markdown"},

  {"junegunn/fzf", build = "./install --all"},
  {"junegunn/fzf.vim"},

  --- themes ---
  {
    "sainnhe/everforest",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[
        " For better performance
        let g:everforest_better_performance = 1
        let g:everforest_background = 'medium'

        colorscheme everforest
      ]])
    end,
  }
})

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when lsp warnings/errors flow in
vim.wo.signcolumn = "yes"

require("plugins/keymap")
-- require("plugins/cmp")
-- require("plugins/rust-tools")
-- require("plugins/nvim-lspconfig")
-- require("plugins/nvim-treesitter")
