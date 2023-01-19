reload("devtrillo")

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight-storm"
lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping


-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.view.relativenumber = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "javascript",
    "json",
    "lua",
    "typescript",
    "tsx",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    "sumneko_lua",
    "jsonls",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact" },
    },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    --   { command = "flake8", filetypes = { "python" } },
    --   {
    --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    --     command = "shellcheck",
    --     ---@usage arguments to pass to the formatter
    --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    --     extra_args = { "--severity", "warning" },
    --   },
    {
        command = "codespell",
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "javascript", "python" },
    },
}

lvim.plugins = {
    { "ellisonleao/gruvbox.nvim" },
    { "navarasu/onedark.nvim", },
    { "folke/trouble.nvim", cmd = "TroubleToggle" },
    { "tpope/vim-surround", event = "VeryLazy" },
    -- Zettlekasten
    -- {
    --     "mickael-menu/zk-nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("zk").setup({
    --             picker = "telescope"
    --         })
    --     end
    -- },
    --
    {
        "epwalsh/obsidian.nvim",
        event = "VeryLazy",
        opts = {
            dir = "/Users/estebantrillo/Library/Mobile Documents/com~apple~CloudDocs/my-vault",
            notes_subdir = "zettlekasten",
            daily_notes = {
                folder = "dailies",
            },
            completion = {
                nvim_cmp = true,
            }
        }
    },
    { "wakatime/vim-wakatime", event = "VimEnter" },
    { "norcalli/nvim-colorizer.lua",
        event = "VimEnter",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "lewis6991/spellsitter.nvim",
        event = "VeryLazy",
        config = function()
            require("spellsitter").setup { enable = true }
        end
    },
    {
        "github/copilot.vim",
        event = "VeryLazy",
        config = function()
            -- copilot assume mapped
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_no_tab_map = true
        end
    },
    {
        "hrsh7th/cmp-copilot",
        config = function()
            lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
            table.insert(lvim.builtin.cmp.sources, { name = "copilot" })
        end
    },
    {
        'dsznajder/vscode-es7-javascript-react-snippets',
        ft = { 'tsx', 'jsx', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        build = 'yarn install --frozen-lockfile && yarn compile'
    },
    { 'mbbill/undotree', event = "VeryLazy" },
    { 'tpope/vim-fugitive', event = "VeryLazy" },
    { "folke/zen-mode.nvim", event = "VeryLazy" },
    {
        "folke/noice.nvim",
        config = function()
            require("noice").setup({})
            require("notify").setup({
                background_colour = "#1e222a",
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }
}


lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" }
local devTrilloGroup = vim.api.nvim_create_augroup("Devtrillo", {})

vim.api.nvim_create_autocmd("InsertLeave", {
    command = "set nowrap | set rnu",
    group = devTrilloGroup
})


vim.api.nvim_create_autocmd("InsertEnter", {
    command = "set nornu",
    group = devTrilloGroup
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    group = devTrilloGroup,
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})



vim.api.nvim_create_autocmd("BufWritePost", {
    group = devTrilloGroup,
    pattern = vim.fn.expand('~') .. "/my-vault/*.md",
    callback = function()
        vim.api.nvim_exec([[silent !git add . && git commit -m "chore: update notes" && git push]], false)
    end
})
