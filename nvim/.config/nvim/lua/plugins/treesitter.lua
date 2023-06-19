return {
{
    "nvim-treesitter/nvim-treesitter",
    version=false,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<c-=>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
    opts={
  auto_install = true,
  ensure_installed={ "typescript", "lua", },
  
  highlight = {
    enable = true,
    }
}
}}
