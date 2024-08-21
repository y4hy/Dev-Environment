return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- set diagnostic severity filter to only show errors
		vim.diagnostic.config(
			{
				virtual_text = {
					severity = vim.diagnostic.severity.ERROR,
				},
				signs = {
					severity = vim.diagnostic.severity.ERROR,
				},
				float = {
					severity_sort = true,
					source = "always",
					border = "rounded",
					severity = vim.diagnostic.severity.ERROR,
				},
			},

			mason_lspconfig.setup_handlers({
				-- default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					-- configure lua server (with special settings)
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								-- make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,

				-- Set up configuration for omnisharp server like lua_ls
				["omnisharp"] = function()
					lspconfig["omnisharp"].setup({
						capabilities = capabilities,
						settings = {
							omnisharp = {
								formattingOptions = {
									EnableEditorConfigSupport = true,
								},
							},
						},
					})
				end,
			})
		)
	end,
}
