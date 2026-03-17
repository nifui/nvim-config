vim.g.mapleader = " "
vim.keymap.set('n', '<leader>tt', ':bnext<CR>', { desc = 'Go to next buffer (e.g., terminal)' })
-- go back to pre existing terminal
vim.keymap.set('n', '<leader>te', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
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
-- Project-wide keyword search
vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "Find word (project)" })

-- Current buffer only (super fast)
vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Find word (buffer)" })

-- Optional: search word under cursor
vim.keymap.set("n", "<leader>fw", function()
   builtin.live_grep({ default_text = vim.fn.expand("<cword>") })
end, { desc = "Find word under cursor" })

vim.keymap.set("n", "<leader>hi", function()
   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)


-- vim.keymap.set("n", "<leader>f", function()
--    local term = vim.fn.input("Grep > ")
--    if term == "" then return end
--    local cmd = table.concat({
--       "grep", "-rnI",
--       "--exclude-dir=.git",
--       "--exclude-dir=target",
--       "--exclude-dir=node_modules",
--       vim.fn.shellescape(term),
--       "."
--    }, " ")

--    local results = vim.fn.systemlist(cmd)

--    if vim.v.shell_error ~= 0 or vim.tbl_isempty(results) then
--       print("No matches found.")
--       return
--    end

--    vim.cmd("copen")
--    vim.fn.setqflist({}, 'r', { title = 'Grep Results', lines = results })
-- end, { desc = "Simple grep (no ripgrep)" })
-- lwk dont wanna use dependencies so imma go with this`
-- fugitive keymaps
vim.keymap.set("i", "_+", "<Esc>")

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
local function save_and_quit()
   if vim.bo.modified then
      local choice = vim.fn.confirm("Save changes before quitting?", "&Yes\n&No\n&Cancel", 1)
      if choice == 1 then
         vim.cmd("write")
         vim.cmd("quit")
      elseif choice == 2 then
         vim.cmd("quit!")
      end
      -- choice == 3 does nothing (cancel)
   else
      vim.cmd("quit")
   end
end
vim.keymap.set("n", "<leader>qw", save_and_quit, { noremap = true })
vim.keymap.set("n", "<leader>rr", ":vsplit<CR>")
vim.keymap.set("n", "<leader>ss", ":split<CR>")
-- undotree keymaps

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<C-Up>", "5k")
vim.keymap.set("n", "<C-Down>", "5j")
vim.keymap.set("n", "<C-Left>", "b")
vim.keymap.set("n", "<C-Right>", "w")

-- lsp && mason keymaps
local function hover()
   vim.lsp.buf.hover({
      border = "rounded",
   })
end

vim.keymap.set("n", "<leader>de", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>ge", hover)
-- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
-- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
-- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)



-- gen keymaps
-- nvim branch keymaps
vim.keymap.set('n', '<leader><Tab>', '<cmd>NvimTreeToggle<CR>')


-- stupid personal preference stuff
vim.keymap.set('n', "<leader>w", ':w<CR>')

--markdown notes taking
vim.keymap.set('n', "<leader>md", ':MarkdownPreview<CR>')
vim.keymap.set('n', "<leader>cd", ':MarkdownPreviewStop<CR>')
vim.keymap.set("n", "<leader>pp", builtin.find_files, { desc = "Find files" })
