local colorscheme = require("plugin.noctis_theme")

local palette = {
    bg0            = "#052529",
    fg             = '#b2cacd',
    grey_blue      = "#b2cacd",
    yolk_yellow    = "#ffd700",
    yellow         = "#ffd700",
    orange         = "#e66533",
    tan            = "#e4b781",
    pink           = "#df769b",
    mint_green     = "#49e9a6",
    brown_orange   = "#d67e5c",
    br_highlight_0 = "#ffd700",
    br_highlight_1 = "#da70d6",
    br_highlight_2 = "#179fff",
    purple         = "#7060eb",
    cyan           = "#16a3b6",
    monotone       = "#5b858b",
    bg1            = '#1A3C43', -- CursorLine/Sign
    bg2            = '#0A1C1F', -- Pmenu
    bg3            = '#1A3C43', -- StatusLine
    bg4            = '#0A1C1F', -- Tabline/Winbar
    bg_red         = '#3A2727',
    bg_green       = '#2B4234',
    bg_blue        = '#193B41',
    red            = '#D17B9A',
    green          = '#78E0A6',
    blue           = '#64AAE4',
    grey           = '#455B5F',
    light_grey     = '#64848A',
    light_yellow   = '#DDB988',
    light_blue     = '#49d6e9',
    none           = 'NONE',
    constant_orang = '#d59718',
    NEON_GREEN     = '#39FF14',
    white          = '#FFFFFF',
    real_red       = '#ff0000',
}
local override = {
    Operator                                    = { fg = palette.pink },
    ["@lsp.type.namespace.rust"]                = { fg = palette.light_blue, },
    ["@lsp.type.function.rust"]                 = { fg = palette.cyan },
    ["@lsp.mod.public.rust"]                    = { fg = palette.cyan },
    ["@lsp.type.parameter.rust"]                = { fg = palette.tan },
    ["@lsp.typemod.variable.declaration.rust"]  = { fg = palette.tan },
    ["@lsp.typemod.parameter.declaration.rust"] = { fg = palette.tan },
    ["@lsp.type.builtinType.rust"]              = { fg = palette.brown_orange, italic = true },
    ["@lsp.type.macro.rust"]                    = { fg = palette.cyan },
    ["@lsp.type.variable.rust"]                 = { fg = palette.tan },
    ["@lsp.type.property.rust"]                 = { fg = palette.grey_blue },
    ["@lsp.type.struct.rust"]                   = { fg = palette.brown_orange },
    ["@lsp.type.const.rust"]                    = { fg = palette.constant_orang, bold = false },
    ["@lsp.typemod.function.declaration.rust"]  = { fg = palette.cyan },
    ["@lsp.import.rust"]                        = { fg = palette.orange },
    ["@keyword.modifier.rust"]                  = { fg = palette.orange },
    ["@keyword.function.rust"]                  = { fg = palette.orange, bold = true },
    ["@keyword.import.rust"]                    = { fg = palette.orange },
    ["@lsp.type.interface.rust"]                = { fg = palette.brown_orange },
    ["@lsp.type.typeAlias.rust"]                = { fg = palette.brown_orange },
    ["@lsp.type.enumMember.rust"]               = { fg = palette.brown_orange },
    ["@punctuation.bracket.rust"]               = { fg = palette.white },
    ["@operator.rust"]                          = { fg = palette.yellow },
    ["@lsp.type.enum.rust"]                     = { fg = palette.brown_orange },
    Delimiter                                   = { fg = palette.pink },
    SpecialChar                                 = { fg = palette.white },
    DiagnosticError                             = { fg = palette.real_red },
    DiagnosticHint                              = { fg = palette.yolk_yellow },
    DiagnosticInfo                              = { fg = palette.light_blue },
    DiagnosticWarn                              = { fg = palette.orange },
    DiagnosticFloatingError                     = { link = 'DiagnosticError' },
    DiagnosticFloatingHint                      = { link = 'DiagnosticHint' },
    DiagnosticFloatingInfo                      = { link = 'DiagnosticInfo' },
    DiagnosticFloatingWarn                      = { link = 'DiagnosticWarn' },
    DiagnosticSignError                         = { link = 'DiagnosticError' },
    DiagnosticSignHint                          = { link = 'DiagnosticHint' },
    DiagnosticSignInfo                          = { link = 'DiagnosticInfo' },
    DiagnosticSignWarn                          = { link = 'DiagnosticWarn' },
    DiagnosticUnderlineError                    = { sp = palette.real_red, undercurl = true },
    DiagnosticUnderlineHint                     = { sp = palette.yolk_yellow, undercurl = true },
    DiagnosticUnderlineInfo                     = { sp = palette.light_blue, undercurl = true },
    DiagnosticUnderlineWarn                     = { sp = palette.orange, undercurl = true },
    DiagnosticVirtualTextError                  = { fg = palette.real_red, bg = palette.bg },
    DiagnosticVirtualTextHint                   = { fg = palette.yolk_yellow, bg = palette.bg },
    DiagnosticVirtualTextInfo                   = { fg = palette.light_blue, bg = palette.bg },
    DiagnosticVirtualTextWarn                   = { fg = palette.orange, bg = palette.bg },
    Statement                                   = { fg = palette.pink },
}
vim.api.nvim_set_hl(0, "CmpItemKind", { fg = palette.br_highlight_2 })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = palette.purple })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = palette.orange })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = palette.green })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = palette.cyan })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = palette.light_grey, italic = true })

vim.o.termguicolors = true
vim.cmd("syntax on")
vim.opt.background = "dark"
vim.g.colors_name = "noctis"
-- apply the palette
colorscheme.from_palette(palette, override)
