--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "css",
    "graphql",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "python",
    "r",
    "rust",
    "scss",
    "svelte",
    "typescript",
    "vim",
    "yaml"
}

lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
--local formatters = require "lvim.lsp.null-ls.formatters"
--formatters.setup {
    --{
        --exe = "prettier",
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        --filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"}
    --}
--}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "black" },
--   {
--     exe = "eslint_d",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "javascriptreact" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
    {"styled-components/vim-styled-components"},
    {"morhetz/gruvbox"},
    {"tpope/vim-surround"},
    {"wakatime/vim-wakatime", event = "VimEnter"},
    {"tpope/vim-eunuch"},
    {"ap/vim-css-color"},
    {"mattn/emmet-vim", opt = true, ft = {"tsx", "js", "jsx", "svelte", "html"}},
    {"folke/trouble.nvim", cmd = "TroubleToggle"}
}

lvim.builtin.dashboard.footer = "devtrillo.com"
lvim.builtin.dashboard.custom_header = {
    "██████╗ ███████╗██╗   ██╗    ██╗   ██╗██╗███╗   ███╗",
    "██╔══██╗██╔════╝██║   ██║    ██║   ██║██║████╗ ████║",
    "██║  ██║█████╗  ██║   ██║    ██║   ██║██║██╔████╔██║",
    "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██████╔╝███████╗ ╚████╔╝      ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═════╝ ╚══════╝  ╚═══╝        ╚═══╝  ╚═╝╚═╝     ╚═╝"
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

lvim.transparent_window = true

vim.api.nvim_command([[
  autocmd BufEnter * :highlight Normal guibg=none
]])

lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = {"<cmd>Trouble lsp_references<cr>", "References"},
    f = {"<cmd>Trouble lsp_definitions<cr>", "Definitions"},
    d = {"<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss"},
    q = {"<cmd>Trouble quickfix<cr>", "QuickFix"},
    l = {"<cmd>Trouble loclist<cr>", "LocationList"},
    w = {"<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss"},
    t = {"<cmd> :TroubleToggle<cr>", "Trouble Toggle"}
}
local function set_background(content)
    vim.fn.system('osascript ~/Documents/Personal/dotfiles/bin/utils/bgImgIterm.scpt "\'' .. content .. '\'"')
end

local function select_background(prompt_bufnr, map)
    local function set_the_background(close)
        local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
        set_background(content.cwd .. "/" .. content.value)
        if close then
            require("telescope.actions").close(prompt_bufnr)
        end
    end

    map(
        "i",
        "<C-p>",
        function()
            set_the_background()
        end
    )

    map(
        "i",
        "<CR>",
        function()
            set_the_background(true)
        end
    )
end

local function image_selector(prompt, cwd)
    return function()
        require("telescope.builtin").find_files(
            {
                prompt_title = prompt,
                cwd = cwd,
                attach_mappings = function(prompt_bufnr, map)
                    select_background(prompt_bufnr, map)

                    -- Please continue mapping (attaching additional key maps):
                    -- Ctrl+n/p to move up and down the list.
                    return true
                end
            }
        )
    end
end
lvim.builtin.which_key.mappings["z"] = {
    name = "+Utils",
    b = {"<cmd>lua require('lvim.custom').background_selector()<cr>", "Change background"}
}

