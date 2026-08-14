local constants = require "custom.constants"
return {
  {
    enabled = not constants.first_install,
    import = "lazyvim.plugins.extras.lang.go",
  },

  {
    "neovim/nvim-lspconfig",
    optional = true,
    init = function()
      vim.filetype.add {
        extension = {
          gotmpl = "gotmpl",
        },
      }
    end,
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = true,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
              },
            },
          },
        },
      },
      setup = {
        -- override LazyVim's stale semanticTokensProvider workaround;
        -- modern gopls advertises the capability (with its own legend) itself.
        gopls = function() end,
      },
    },
  },

  -- undo none-ls changes added by LazyVim
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
  },
}
