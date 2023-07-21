local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_extra_mappings = true,
    omit = { '<F2>', '<F4>' },
  },
})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  -- Keymap overrides
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = "[R]e[n]ame" })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "[C]ode [A]ction" })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  mapping = {
    -- Use Enter to confirm selection
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  }
})
