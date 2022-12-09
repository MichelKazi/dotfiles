local dashboard = require("dashboard")
dashboard.custom_header = {
  '',
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
  '                            🌼🐝                       ',
  '',
  '',
}

dashboard.custom_center = {
	{
		icon = "  ",
		desc = "Last Session                           ",
		shortcut = ":SessionLoad",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "File Browser                           ",
		shortcut = ":NeoTreeFloat",
		action = "NeoTreeFloat",
	},
	{
		icon = "  ",
		desc = "New file                               ",
		shortcut = ":enew",
		action = "enew",
	},
	{
		icon = "  ",
		desc = "Find file                              ",
		shortcut = "SPC f",
		action = "Telescope find_files hidden=true no_ignore=true",
	},
	{
		icon = "  ",
		desc = "Browse dotfiles                        ",
		shortcut = "SPC v d",
		action = "Telescope find_files cwd=~/.config/nvim/ search_dirs=Ultisnips,lua,viml,init.vim",
	},
	{
		icon = "  ",
		desc = "Update plugins                         ",
		shortcut = ":PlugUpdate",
		action = "PlugUpdate",
	},
	{
		icon = "  ",
		desc = "Close neovim                           ",
		shortcut = ":qa!",
		action = "qa!",
	},
}
