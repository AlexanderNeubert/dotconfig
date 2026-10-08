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
              buildFlags = { "-tags=integration" },
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

  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["neotest-golang"] = {
          go_test_args = { "-v", "-race", "-count=1", "-tags=integration" },
          go_list_args = { "-tags=integration" },
          dap_go_opts = {
            delve = {
              build_flags = "-tags=integration",
            },
          },
        },
      },
    },
  },

  -- undo none-ls changes added by LazyVim
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
  },
}
