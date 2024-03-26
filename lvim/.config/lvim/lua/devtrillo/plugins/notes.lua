vim.opt.conceallevel = 2
table.insert(lvim.plugins,
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    keys = {
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian Search" },
      { "<leader>on", "<cmd>ObsidianNew<cr>",    desc = "Obsidian New" },
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "/Users/trillo/Library/Mobile Documents/iCloud~md~obsidian/Documents/my-vault",
        },
      },

      -- see below for full list of options 👇
    },
  })
