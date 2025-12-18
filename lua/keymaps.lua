vim.g.mapleader = " "
vim.keymap.set('n', '<leader>tt', ':bnext<CR>', { desc = 'Go to next buffer (e.g., terminal)' })
-- go back to pre existing terminal
vim.keymap.set('n', '<leader>te', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
-- telescope keymaps

-- Function to toggle a floating terminal
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files)
vim.keymap.set("n", "<C-g>", builtin.git_files)
vim.keymap.set("n", "<leader>d", function()
   require("telescope.builtin").diagnostics({
      sort_by = "severity", -- sort by severity (errors first)
   })
end, { desc = "Diagnostics (sorted by severity)" })
vim.keymap.set("n", "<leader>f", function()
   local term = vim.fn.input("Grep > ")
   if term == "" then return end
   local cmd = table.concat({
      "grep", "-rnI",
      "--exclude-dir=.git",
      "--exclude-dir=target",
      "--exclude-dir=node_modules",
      vim.fn.shellescape(term),
      "."
   }, " ")

   local results = vim.fn.systemlist(cmd)

   if vim.v.shell_error ~= 0 or vim.tbl_isempty(results) then
      print("No matches found.")
      return
   end

   vim.cmd("copen")
   vim.fn.setqflist({}, 'r', { title = 'Grep Results', lines = results })
end, { desc = "Simple grep (no ripgrep)" })
-- lwk dont wanna use dependencies so imma go with this`
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

vim.keymap.set("n", "<leader>a", mark.add_file)
-- init.lua
vim.keymap.set('n', '<C-a>', '<C-w>h')
vim.keymap.set('n', '<C-s>', '<C-w>j')
vim.keymap.set('n', '<C-e>', '<C-w>k')
vim.keymap.set('n', '<C-d>', '<C-w>l')

vim.keymap.set("n", "<C-t>", function() term.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>qw", ":q<CR>")
vim.keymap.set("n", "<leader>rr", ":vsplit<CR>")
vim.keymap.set("n", "<leader>ii", ":split<CR>")
-- undotree keymaps

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- lsp && mason keymaps

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)

-- gen keymaps
-- nvim branch keymaps
vim.keymap.set('n', '<leader>qq', '<cmd>NvimTreeToggle<CR>')


-- stupid personal preference stuff
vim.keymap.set('n', "<leader>w", ':w<CR>')

--markdown notes taking
vim.keymap.set('n', "<leader>md", ':MarkdownPreview<CR>')
vim.keymap.set('n', "<leader>cd", ':MarkdownPreviewStop<CR>')
vim.keymap.set("n", "<leader>pp", builtin.find_files, { desc = "Find files" })
