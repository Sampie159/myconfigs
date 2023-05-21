local null_ls = require("null-ls")
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre"
local async = event == "BufWritePost"

local null_sources = {
  require('typescript.extensions.null-ls.code-actions'),
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.clang_format,
  null_ls.builtins.formatting.gofumpt,
  null_ls.builtins.formatting.fourmolu,
  null_ls.builtins.formatting.prettier.with({
    extra_filetypes = { "svelte" },
  }),
}

null_ls.setup({
  sources = null_sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<leader>f", function () 
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() }) end,
        { buffer = bufnr, desc = "[lsp] format" })

    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = '[lsp] format on save',
    })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})
