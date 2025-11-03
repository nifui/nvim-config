local highlight = vim.api.nvim_set_hl;

--this just a backup file incase i didnt set some stuff
--probably better off leaving it blank so i know what i didnt set but im too lazy to do it
return {
    from_palette = function(palette, override)
        local highlight_groups = {
            Normal      = { fg = palette.fg, bg = palette.bg0 },
            NormalNC    = { fg = palette.fg, bg = palette.b0 },
            Terminal    = { fg = palette.fg, bg = palette.bg0 },
            EndOfBuffer = { fg = palette.bg0, bg = palette.bg0 },
        }

        for group, config in pairs(highlight_groups) do
            highlight(0, group, config)
        end

        if override ~= nil then
            for group, config in pairs(override) do
                highlight(0, group, config)
            end
        end
    end
};
-- got this from noctis.nvim not my own so
