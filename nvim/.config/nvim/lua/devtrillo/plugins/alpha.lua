local icons = require("devtrillo.icons")
return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			
      dashboard.section.buttons.val = {
				dashboard.button("e", icons.kind.File .. " New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", icons.ui.Search .. " Search File", ":Telescope find_files <CR>"),
				dashboard.button("t", icons.ui.Search .. " Search Text", ":Telescope grep_string <CR>"),
				dashboard.button("l", icons.ui.Cog .. " Lazy", ":Lazy <CR>"),
				dashboard.button("q", icons.ui.Fire .. " Quit NVIM", ":qa<CR>"),
			}
			local handle = io.popen("cowsay $(fortune)")
			if handle ~= nil then
				local fortune = handle:read("*a")
				handle:close()
			dashboard.section.header.val = fortune
			else
			dashboard.section.header.val = { [[The ultimate editor]] }
			end
			dashboard.config.opts.noautocmd = true

			vim.cmd([[autocmd User AlphaReady echo 'ready']])

			alpha.setup(dashboard.config)
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
