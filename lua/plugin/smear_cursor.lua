return {
    "sphamba/smear-cursor.nvim",

    opts = {
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        scroll_buffer_space = true,
        legacy_computing_symbols_support = true,
        smear_insert_mode = true,

        cursor_color = "#00d1d13",

        -- animation tuning
        stiffness = 0.15,          -- lower = smoother
        trailing_stiffness = 0.08, -- keep lower than stiffness
        damping = 0.2,             -- reduces oscillation
        trailing_exponent = 6,     -- smoother decay curve

        -- rendering tweaks
        never_draw_over_target = false, -- let it blend more naturally
        hide_target_hack = false,       -- can cause a snap at rest
        gamma = 1.0,
    }
}
