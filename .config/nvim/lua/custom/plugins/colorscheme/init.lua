return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup {
      variant = "main",
      highlight_groups = {
        LspReferenceText  = { fg = "base", bg = "pine", bold = true },
        LspReferenceRead  = { fg = "base", bg = "pine", bold = true },
        LspReferenceWrite = { fg = "base", bg = "pine", bold = true },
        Search    = { fg = "base", bg = "foam", bold = true },
        CurSearch = { fg = "base", bg = "pine", bold = true },

        RenderMarkdownH1 = { fg = "pine",   bold = true },
        RenderMarkdownH2 = { fg = "foam",   bold = true },
        RenderMarkdownH3 = { fg = "iris",   bold = true },
        RenderMarkdownH4 = { fg = "rose" },
        RenderMarkdownH5 = { fg = "subtle" },
        RenderMarkdownH6 = { fg = "muted" },

        RenderMarkdownH1Bg = { bg = "overlay" },
        RenderMarkdownH2Bg = { bg = "surface" },
        RenderMarkdownH3Bg = { bg = "surface" },
        RenderMarkdownH4Bg = { bg = "surface" },
        RenderMarkdownH5Bg = { bg = "base" },
        RenderMarkdownH6Bg = { bg = "base" },

        RenderMarkdownCode      = { bg = "surface" },
        RenderMarkdownLink      = { fg = "foam", underline = true },
        RenderMarkdownQuote     = { fg = "muted" },
        RenderMarkdownBullet    = { fg = "pine" },
        RenderMarkdownDash      = { fg = "overlay" },
        RenderMarkdownTableHead = { fg = "pine", bold = true },
        RenderMarkdownChecked   = { fg = "pine" },
        RenderMarkdownUnchecked = { fg = "muted" },
      },
    }

    vim.cmd.colorscheme "rose-pine"
  end,
}
