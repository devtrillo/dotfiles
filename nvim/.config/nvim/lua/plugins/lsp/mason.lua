return {
  'williamboman/mason.nvim',
  dependencies = {
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {
        ensure_installed = {
          'tsserver',
          'html',
          'cssls',
          'tailwindcss',
          'svelte',
          'lua_ls',
          'graphql',
          'pyright',
        },
      },
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          'prettier', -- prettier formatter
          'stylua', -- lua formatter
          'isort', -- python formatter
          'black', -- python formatter
          'pylint',
          'eslint_d',
        },
      },
    },
    { 'neovim/nvim-lspconfig' },
  },
  opts = {
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  },
}
