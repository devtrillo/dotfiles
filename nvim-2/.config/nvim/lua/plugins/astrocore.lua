-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {},
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {},
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        ["E"] = { "<Cmd>NvimTreeToggle<CR>", desc = "Toggle Explorer" },
        ["e"] = false,
        ["[d"] = { vim.diagnostic.goto_prev, desc = "Go to previous diagnostic messages" },
        ["]d"] = { vim.diagnostic.goto_next, desc = "Go to next diagnostic messages" },
      },

      -- tables with just a `desc` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      -- ["<Leader>b"] = { desc = "Buffers" },

      -- setting a mapping to false will disable it
    },
  },
}
