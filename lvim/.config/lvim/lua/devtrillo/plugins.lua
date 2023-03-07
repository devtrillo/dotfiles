lvim.plugins = {
	{ "petertriho/nvim-scrollbar", event = "VeryLazy" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "wakatime/vim-wakatime", event = "VeryLazy" },
	{ "mbbill/undotree", event = "VeryLazy" },
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "ZenMode toggle" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = true,
	},
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		dependencies = {
			"tpope/vim-repeat",
		},
	},
	{
		"lewis6991/spellsitter.nvim",
		event = "VeryLazy",
		opts = { enable = true },
	},
	-- {
	-- 	"github/copilot.vim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		-- copilot assume mapped
	-- 		vim.g.copilot_assume_mapped = true
	-- 		vim.g.copilot_no_tab_map = true
	-- 	end,
	-- },
	-- {
	-- 	"hrsh7th/cmp-copilot",
	-- 	config = function()
	-- 		lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
	-- 		table.insert(lvim.builtin.cmp.sources, 2, { name = "copilot" })
	-- 	end,
	-- },
	{
		"epwalsh/obsidian.nvim",
		event = "VeryLazy",
		opts = {
			dir = "/Users/trillo/Library/Mobile Documents/iCloud~md~obsidian/Documents/my-vault",
			completion = {
				nvim_cmp = true,
			},
		},
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		ft = { "tsx", "jsx", "javascript", "javascriptreact", "typescript", "typescriptreact" },
		build = "yarn install --frozen-lockfile && yarn compile",
	},
	-- removing temprarly this plugin because it's not letting the record functionality
	-- {
	-- 	"folke/noice.nvim",
	-- 	lazy = false,
	-- 	priority = 0,
	-- 	opts = {
	-- 		views = {
	-- 			cmdline_popup = {
	-- 				position = {
	-- 					row = 5,
	-- 					col = "50%",
	-- 				},
	-- 				size = {
	-- 					width = 60,
	-- 					height = "auto",
	-- 				},
	-- 			},
	-- 			popupmenu = {
	-- 				relative = "editor",
	-- 				position = {
	-- 					row = 8,
	-- 					col = "50%",
	-- 				},
	-- 				size = {
	-- 					width = 60,
	-- 					height = 10,
	-- 				},
	-- 				border = {
	-- 					style = "rounded",
	-- 					padding = { 0, 1 },
	-- 				},
	-- 				win_options = {
	-- 				},
	-- 			},
	-- 		},
	-- 		routes = {
	-- 			{
	-- 				view = "notify",
	-- 				filter = { event = "msg_showmode" },
	-- 			},
	-- 		},
	-- 		lsp = {
	-- 			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 				["cmp.entry.get_documentation"] = true,
	-- 			},
	-- 		},
	-- 		-- you can enable a preset for easier configuration
	-- 		presets = {
	-- 			bottom_search = true, -- use a classic bottom cmdline for search
	-- 			command_palette = true, -- position the cmdline and popupmenu together
	-- 			long_message_to_split = true, -- long messages will be sent to a split
	-- 			inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 			lsp_doc_border = false, -- add a border to hover docs and signature help
	-- 		},
	-- 	},

	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		{
	-- 			"rcarriga/nvim-notify",
	-- 			opts = {
	-- 				background_colour = "#1e222a",
	-- 			},
	-- 		},
	-- 	},

	-- },

	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},
}
