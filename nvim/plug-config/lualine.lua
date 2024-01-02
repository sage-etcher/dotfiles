
local custom_palenight = require('lualine.themes.palenight')

-- Change the 'black' color for palenight theme to '#303030'
custom_palenight.normal.a.fg = '#303030'
custom_palenight.normal.c.bg = '#303030'
custom_palenight.insert.a.fg = '#303030'
custom_palenight.visual.a.fg = '#303030'
custom_palenight.replace.a.fg = '#303030'
custom_palenight.inactive.a.fg = '#303030'
custom_palenight.inactive.b.fg = '#303030'
custom_palenight.inactive.c.fg = '#303030'


require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = custom_palenight,
		global_status = true,
		refresh = {
			statusline = 1500,
			tabline = 2000
		}
	},
	tabline = {
		lualine_a = {
			{
				'buffers',
				mode = 4
			}
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	}
}


