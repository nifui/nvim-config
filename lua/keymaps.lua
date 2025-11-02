vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>tt', ':bnext<CR>', { desc = 'Go to next buffer (e.g., terminal)' })
-- go back to pre existing terminal

vim.g.mapleader = " "
-- telescope keymaps

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files)
vim.keymap.set("n", "<C-g>", builtin.git_files)
vim.keymap.set("n", "<leader>f", function()
   builtin.grep_string({ search = vim.fn.input("Grep > ") })
end
)
vim.keymap.set("n", "<leader>d", function()
   require("telescope.builtin").diagnostics({
      sort_by = "severity", -- sort by severity (errors first)
   })
end, { desc = "Diagnostics (sorted by severity)" })
-- fugitive keymaps

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "td", function()
   if vim.api.nvim_win_get_config(0).relative == "" then -- Not inside floating window
      vim.diagnostic.open_float(nil, { focus = false })  -- Another call jumps into the floating window
   else                                                  -- Inside a floating window
      vim.api.nvim_win_close(0, false)                   -- Or you can press "q" in the floating window
   end
end, { desc = "[t] Toggle diagnostic floating window" })
-- harpoon keymaps

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-j>", ui.nav_next)
vim.keymap.set("n", "<C-k>", ui.nav_prev)
vim.keymap.set("n", "<C-t>", function() term.gotoTerminal(1) end)

-- undotree keymaps

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- lsp && mason keymaps

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)

-- gen keymaps

vim.keymap.set('v', '<leader>ia', ':Gen<CR>')

-- nvim branch keymaps
vim.keymap.set('n', '<leader>q', '<cmd>NvimTreeToggle<CR>')
