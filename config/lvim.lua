-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

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
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["C"] = { name = "+Copilot", t = { "<cmd>Copilot open<CR>", "Panel" } }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

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



lvim.plugins = {
  { "folke/trouble.nvim", cmd = "TroubleToggle" },
  -- { "github/copilot.vim" },
  { "tpope/vim-surround" },
  { "wakatime/vim-wakatime", event = "VimEnter" },
  {
    "lewis6991/spellsitter.nvim",
    config = function()
      require("spellsitter").setup { enable = true }
    end
  },
  {
    "github/copilot.vim",
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
  }
}


local devTrilloGroup = vim.api.nvim_create_augroup("Devtrillo", {})

vim.api.nvim_create_autocmd("InsertLeave", {
  command = "set nowrap | set rnu",
  group = devTrilloGroup
})


vim.api.nvim_create_autocmd("InsertEnter", {
  command = "set nornu | set wrap linebreak nolist showbreak=-->>",
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
