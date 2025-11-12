return {
    "sphamba/smear-cursor.nvim",
    opts = {
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        scroll_buffer_space = true,
        legacy_computing_symbols_support = true,
        smear_insert_mode = true,

        cursor_color = "#00d1d1",

        -- smoother animation tuning
        stiffness = 0.35,          -- slightly higher for more responsiveness
        trailing_stiffness = 0.15, -- keep tail smooth and delayed
        damping = 0.25,            -- more damping = less bounce
        trailing_exponent = 1.6,   -- smoother decay curve
        gamma = 0.9,               -- makes color blending smoother

        -- rendering tweaks
        never_draw_over_target = false,
        hide_target_hack = false,
    }
}
