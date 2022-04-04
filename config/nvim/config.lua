vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

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
  { command = "prettier" },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" , "python" },
  },
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
  }
}

-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},
    {"folke/trouble.nvim", cmd = "TroubleToggle"},
    {"github/copilot.vim"},
    {"morhetz/gruvbox"},
    {"tpope/vim-surround"},
    {"wakatime/vim-wakatime", event = "VimEnter"},
    {
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup {enable = true}
        end
    }

}
-- lvim.builtin.alpha.dashboard.section.header = {
--     "                                                    ",
--     "                                                    ",
--     "██████╗ ███████╗██╗   ██╗    ██╗   ██╗██╗███╗   ███╗",
--     "██╔══██╗██╔════╝██║   ██║    ██║   ██║██║████╗ ████║",
--     "██║  ██║█████╗  ██║   ██║    ██║   ██║██║██╔████╔██║",
--     "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚██╗ ██╔╝██║██║╚██╔╝██║",
--     "██████╔╝███████╗ ╚████╔╝      ╚████╔╝ ██║██║ ╚═╝ ██║",
--     "╚═════╝ ╚══════╝  ╚═══╝        ╚═══╝  ╚═╝╚═╝     ╚═╝",
--     "                                                    ",
--     "                                                    "
-- }

lvim.transparent_window = true

lvim.autocommands.custom_groups = {
    {"BufEnter,FocusGained,InsertLeave,WinEnter", "*", 'if &nu && mode() != "i" | set rnu   | endif'},
    {"BufEnter,FocusGained,InsertLeave,WinEnter", "*", "set wrap linebreak nolist showbreak=-->>"},
    {"BufLeave,FocusLost,InsertEnter,WinLeave", "*", "if &nu | set nornu | endif"},
    {"BufLeave,FocusLost,InsertEnter,WinLeave", "*", "set nowrap"}
    -- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
    -- { "InsertEnter", "*", ":normal zz"},
}

local function set_background(content)
    vim.api.nvim_command(
        "silent !osascript ~/Documents/Personal/dotfiles/bin/utils/bgImgIterm.scpt '" .. content .. "'"
    )
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
                previewer = true,
                shorten_path = false,
                attach_mappings = function(prompt_bufnr, map)
                    select_background(prompt_bufnr, map)
                    return true
                end
            }
        )
    end
end

local background_selector = image_selector("< Backgrounds > ", "~/Documents/Personal/dotfiles/Images")
local search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "~/Documents/Personal/dotfiles",
    })
end

lvim.builtin.which_key.mappings["x"] = {
    name = "+Custom",
    x = {background_selector, "Background"},
    d = {search_dotfiles, "DotFiles"},
    z = {"<cmd>Telescope colorscheme<cr>", "Theme"},
    t = {"<cmd>ToggleTerm<cr>", "Theme"},
}

