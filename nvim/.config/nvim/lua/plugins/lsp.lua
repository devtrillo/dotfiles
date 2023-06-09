return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{ "jose-elias-alvarez/null-ls.nvim", event = "VeryLazy" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = true,
		cmd = "Trouble",
		keys = {
			{ "<leader>tt", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
		},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			require("lsp-zero.settings").preset({})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{ "copilot.lua" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

			require("lsp-zero.cmp").extend()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},

				mapping = {
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
					["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
					["<Tab>"] = cmp.mapping.select_prev_item(cmp_select_opts),
					["<S-Tab>"] = cmp.mapping.select_next_item(cmp_select_opts),
					["<C-p>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item(cmp_select_opts)
						else
							cmp.complete()
						end
					end),
					["<C-n>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_next_item(cmp_select_opts)
						else
							cmp.complete()
						end
					end),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					documentation = {
						max_height = 15,
						max_width = 60,
					},
				},
				formatting = {
					fields = { "abbr", "menu", "kind" },
					format = function(entry, item)
						local short_name = {
							nvim_lsp = "LSP",
							nvim_lua = "nvim",
						}

						local menu_name = short_name[entry.source.name] or entry.source.name

						item.menu = string.format("[%s]", menu_name)
						return item
					end,
				},
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jay-babu/mason-null-ls.nvim" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
		},
		config = function()
			-- This is where all the LSP shenanigans will live

			local lsp = require("lsp-zero")
			local lspconfig = require("lspconfig")

			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},
				servers = {
					["null-ls"] = { "javascript", "typescript", "lua" },
				},
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lsp.setup()
			require("mason-null-ls").setup({
				ensure_installed = {},
				automatic_installation = true,
				handlers = {},
			})
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Replace these with the tools you have installed
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.stylua,
				},
			})
			-- (Optional) Configure lua language server for neovim
			--     require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
			-- require('lspconfig').eslint.setup({
			--  on_attach = function(client, bufnr)
			--   vim.api.nvim_create_autocmd("BufWritePre", {
			--    buffer = bufnr,
			--   command = "EslintFixAll",
			--})
			-- end,
			--})
		end,
	},
}
