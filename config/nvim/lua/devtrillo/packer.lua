local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local packerGroup = augroup("pluginsGroup", {})

autocmd("BufWritePost", {
    command = "source <afile> | PackerSync",
    group = packerGroup,
    pattern = { "packer.lua" },
})

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

local plenary = "nvim-lua/plenary.nvim"
return packer.startup(function()
    use("wbthomason/packer.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    -- cmp
    use("hrsh7th/cmp-nvim-lsp")
    use("RRethy/vim-illuminate")
    use({ "hrsh7th/nvim-cmp", requires = { "L3MON4D3/LuaSnip" } })

    use({ "petertriho/cmp-git", requires = plenary })
    use("kyazdani42/nvim-tree.lua")
    use("akinsho/toggleterm.nvim")
    -- use "github/copilot.vim"
    use({
        "zbirenbaum/copilot.lua",
        requires = { use({ "zbirenbaum/copilot-cmp", module = "copilot_cmp" }) },
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end,
    })
    use("folke/which-key.nvim")
    use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = plenary })
    use({
        "williamboman/mason.nvim",
        requires = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },
    })
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
    })

    use({
        "TimUntersberger/neogit",
        config = function()
            require("neogit").setup({})
        end,
    })
    use("tpope/vim-surround")

    use({ "folke/trouble.nvim", opt = true, cmd = "TroubleToggle" })
    use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
    use("romgrk/nvim-treesitter-context")

    use({ "gruvbox-community/gruvbox", disabled = devtrillo.colorscheme ~= "gruvbox" })
    use({ "folke/tokyonight.nvim", disabled = devtrillo.colorscheme ~= "tokyonight" })
    use({ "joshdick/onedark.vim", disabled = devtrillo.colorscheme ~= "onedark" })
    use("wakatime/vim-wakatime")
end)
