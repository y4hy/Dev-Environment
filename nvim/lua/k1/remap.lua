local k = vim.keymap

vim.g.mapleader = " "

k.set("i", "jk", "<Esc>")

k.set("n", "<leader>e", vim.cmd.Ex)

k.set("n", "<leader>sv", "<C-w>v")
k.set("n", "<leader>ss", "<C-w>s")
k.set("n", "<leader>se", "<C-w>=")
k.set("n", "<leader>sx", "<cmd>close<CR>")

k.set("n", "<leader>nn", "<cmd>tabnew<CR>")
k.set("n", "<leader>nx", "<cmd>tabclose<CR>")
k.set("n", "<leader>nm", "<cmd>tabn<CR>")
k.set("n", "<leader>nb", "<cmd>tabp<CR>")

k.set("n", "<leader>nh", "<cmd>noh<CR>")

vim.cmd([[
  let g:netrw_nogx = 1
  autocmd FileType netrw nmap <buffer> <Tab> <CR>
]])

-- Copilot keybindings
k.set("i", "<C-b>", '<Plug>(copilot-next)')
k.set("i", "<C-w>", '<Plug>(copilot-previous)')
k.set("i", "<C-l>", '<Plug>(copilot-accept-line)')
k.set("i", "<C-s>", '<Plug>(copilot-suggest)')

-- Clipboard keybindings
k.set("v", "<C-c>", '"+y')
