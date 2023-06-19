lvim.format_on_save.enabled = true
-- lvim.transparent_window = true
lvim.colorscheme = "catppuccin-mocha"


reload("devtrillo.plugins")

lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-j>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<C-/>"] = ":ToggleTerm<CR>"
