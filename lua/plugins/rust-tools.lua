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
