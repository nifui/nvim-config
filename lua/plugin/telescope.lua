local M = {
   "nvim-telescope/telescope.nvim",
   dependencies = { "nvim-lua/plenary.nvim" },
   cmd = "Telescope",
}

function M.config()
   local telescope = require("telescope")
   local actions = require("telescope.actions")
   local previewers = require("telescope.previewers")

   telescope.setup({
      defaults = {
         prompt_prefix = " ",
         selection_caret = "❯ ",
         path_display = { "smart" },

         -- 🔍 Previewers
         file_previewer = previewers.vim_buffer_cat.new,
         grep_previewer = previewers.vim_buffer_vimgrep.new,
         qflist_previewer = previewers.vim_buffer_qflist.new,

         -- Optional performance tweaks
         buffer_previewer_maker = previewers.buffer_previewer_maker,

         mappings = {
            i = {
               ["<C-j>"] = actions.move_selection_next,
               ["<C-k>"] = actions.move_selection_previous,
               ["<Esc>"] = actions.close,
            },
         },

         file_ignore_patterns = {
            "node_modules",
            ".git/",
            "dist",
            "build",
         },
      },
   })
end

return M
