vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>e", "<cmd>Exp<CR>")

vim.cmd([[
  let g:netrw_nogx = 1
  autocmd FileType netrw nmap <buffer> <Tab> <CR>
]])

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>nn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>nx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>nm", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>nb", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab

keymap.set("i", "<C-b>", '<Plug>(copilot-next)')
keymap.set("i", "<C-s>", '<Plug>(copilot-suggest)')
keymap.set("i", "<C-l>", '<Plug>(copilot-accept-line)')
keymap.set("i", "<C-w>", '<Plug>(copilot-previous)')
keymap.set("i", "<C-k>", '<Plug>(copilot-accept-word)')

-- copy to clipboard
keymap.set("v", "<C-c>", '"+y')

-- move lines
keymap.set("n", "<C-j>", ':m-2<CR>==', { desc = "Move line up" })
keymap.set("n", "<C-k>", ':m+1<CR>==', { desc = "Move line down" })
keymap.set("v", "<C-k>", ":m-2<CR>gv=gv", { desc = "Move selected lines up" })
keymap.set("v", "<C-j>", ":m'>+1<CR>gv=gv", { desc = "Move selected lines down" })
