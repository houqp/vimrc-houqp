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

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so mappings are correct

require("lazy").setup({
  ----------------
  -- languages ---
  ----------------
  {
    'neovim/nvim-lspconfig',
    config = require("plugins/nvim-lspconfig"),
  },

  -- rust related
  {
    "rust-lang/rust.vim", ft = {"rs", "rust"},
    config = function() vim.g.rustfmt_autosave = 1 end,
  },
  {
    "racer-rust/vim-racer", ft = {"rs", "rust"},
    config = function()
      -- show argument list and return type in racer completion
      vim.g.racer_experimental_completer = 1
    end,
  },
  {
    'simrat39/rust-tools.nvim', ft = {"rs", "rust"},
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

  {
    "fatih/vim-go",
    ft = "go",
    config = function()
      vim.cmd([[
        let g:go_fmt_command = "gofmt"
        let g:go_fmt_options = {
          \ 'gofmt': '-s',
          \ }
        let g:go_imports_autosave = 1
      ]])
    end,
  },
  {"tfnico/vim-gradle", ft = "gradle"},
  {
    -- live markdown render
    "euclio/vim-markdown-composer",
    ft = {"md", "markdown"},
    build = "cargo build --release --locked",
    config = function()
      -- disable live render auto start, use :ComposerStart command to manually start the render
      vim.g.markdown_composer_autostart = 0
    end,
  },
  {
    -- for auto format on save
    "hashivim/vim-terraform",
    ft = {"tf", "terraform"},
    config = function()
      vim.cmd([[
        """"""""""""""""""""""""""""""
        " Allow vim-terraform to align settings automatically with Tabularize.
        """"""""""""""""""""""""""""""
        let g:terraform_align=1
        let g:terraform_fmt_on_save=1
      ]])
    end,
  },
  {"zchee/vim-flatbuffers", ft = "fbs"},

  -- web dev
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
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = require("plugins/nvim-treesitter"),
  },

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
  {
    "vim-airline/vim-airline",
    dependencies = {"vim-airline/vim-airline-themes"},
    config = function()
      vim.cmd([[
        set laststatus=2
        let g:airline_theme='bubblegum'
        let g:airline_left_sep=''
        let g:airline_right_sep=''
        let g:airline_detect_modified=1
        let g:airline_detect_paste=1
        let g:airline_mode_map = {
          \ '__' : '-',
          \ 'n'  : 'N',
          \ 'i'  : 'I',
          \ 'R'  : 'R',
          \ 'c'  : 'C',
          \ 'v'  : 'V',
          \ 'V'  : 'V',
          \ '' : 'V',
          \ 's'  : 'S',
          \ 'S'  : 'S',
          \ '' : 'S',
          \ }
      ]])
    end,
  },
  {
    "bronson/vim-trailing-whitespace",
    event = "VeryLazy",
  },
  {"rhysd/vim-grammarous", ft = "markdown"},

  {
    "junegunn/fzf",
    build = "./install --all",
    dependencies = {
      {
        "junegunn/fzf.vim",
        config = function()
          vim.cmd([[
            let g:fzf_vim = {}
            let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }

            nmap <C-p> :GitFiles<cr>
            nmap <leader>r :Rg<cr>
            nmap <leader>f :ProjectFiles<cr>
            nmap <leader>bf :Buffers<cr>
            nmap <leader>c :Commits<cr>

            function! s:find_git_root()
              return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
            endfunction
            command! ProjectFiles execute 'Files' s:find_git_root()
          ]])
        end
      }
    },
  },

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

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
