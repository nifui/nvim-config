local palette = require('plugin.lang_themes.palette')
local C = {
    ["@keyword.import.c"] = { fg = palette.pink },
    ["@constant.macro.c"] = { fg = palette.constant_orang },
    ["@string.c"] = { fg = palette.green },
    ["@function.call.c"] = { fg = palette.cyan },
    ["@punctuation.bracket.c"] = { fg = palette.yolk_yellow },
    ["@variable.c"] = { fg = palette.brown_orange },
    ["@keyword.type.c"] = { fg = palette.orange },
    ["@keyword.modifier.c"] = { fg = palette.pink },
    ["@type.builtin.c"] = { fg = palette.brown_orange },
    ["@operator.c"] = { fg = palette.pink },
    ["@boolean.c"] = { fg = palette.purple },
    ["@number.c"] = { fg = palette.purple },
    ["@string.escape.c"] = { fg = palette.br_highlight_2 },
    ["@constant.c"] = { fg = palette.constant_orang },
    ["@lsp.type.function.c"] = { fg = palette.cyan },
    ["@type.c"] = { fg = palette.tan },
}
return C;
