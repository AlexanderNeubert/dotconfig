return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    local mocha = require("catppuccin.palettes").get_palette "mocha"

    local function apply_catppuccin_overrides()
      local fg_dark = mocha.base
      vim.api.nvim_set_hl(0, "LspReferenceText", { fg = fg_dark, bg = mocha.blue, bold = true })
      vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = fg_dark, bg = mocha.blue, bold = true })
      vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = fg_dark, bg = mocha.blue, bold = true })
      vim.api.nvim_set_hl(0, "Search", { fg = fg_dark, bg = mocha.sky, bold = true })
      vim.api.nvim_set_hl(0, "CurSearch", { fg = fg_dark, bg = mocha.teal, bold = true })

      -- MARKDOWN OVERRIDE --
      -- render-markdown: heading foregrounds (H1 brightest → H6 most muted)
      vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = mocha.teal, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = mocha.blue, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = mocha.sky, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = mocha.sapphire, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = mocha.subtext1 })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = mocha.overlay1 })

      -- render-markdown: heading backgrounds (subtle gradient, most visible at H1)
      vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = mocha.surface1 })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = mocha.surface0 })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = mocha.mantle })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = mocha.mantle })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = mocha.base })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = mocha.base })

      -- render-markdown: code blocks and inline code
      vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = mocha.mantle })

      -- render-markdown: links
      vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = mocha.sky, underline = true })

      -- render-markdown: blockquotes
      vim.api.nvim_set_hl(0, "RenderMarkdownQuote", { fg = mocha.overlay1 })

      -- render-markdown: bullets
      vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = mocha.teal })

      -- render-markdown: horizontal rule
      vim.api.nvim_set_hl(0, "RenderMarkdownDash", { fg = mocha.surface1 })

      -- render-markdown: table header
      vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = mocha.blue, bold = true })

      -- render-markdown: checkboxes
      vim.api.nvim_set_hl(0, "RenderMarkdownChecked",   { fg = mocha.teal })
      vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = mocha.overlay1 })
    end

    require("catppuccin").setup {
      flavour = "mocha",
    }

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catppuccin*",
      callback = apply_catppuccin_overrides,
    })

    if vim.g.colors_name and vim.g.colors_name:match("^catppuccin") then
      apply_catppuccin_overrides()
    end
  end,
}
