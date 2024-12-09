local C = require("kanban.theme.colors")
require("kanban").setup({
	move_position = "top", -- top or bottom
	add_position = "bottom", -- top or bottom
	layout = {
		x_margin = 0,
		y_margin = 0,
		list_x_margin = 2,
		task_y_margin = 2,
		task_height = 3,
		uncomplete_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		complete_border = { "✔", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
	markdown = {
		description_folder = "./tasks/", -- "./"
		list_head = "## ",
		due_head = "@",
		due_style = "{<due>}",
		tag_head = "#",
		tag_style = "<tag>",
		header = {
			"---",
			"",
			"kanban-plugin: basic",
			"",
			"---",
			"",
		},
		footer = {
			"",
			"",
			"%% kanban:settings",
			"```",
			'{"kanban-plugin":"basic"}',
			"```",
			"%%",
		},
	},
	hl = {
		{
			name = "KanbanFloat",
			ops = {},
		},
		{
			name = "ListFloat",
			ops = {},
		},
		{
			name = "TaskFloat", -- list border
			ops = {},
		},
		{
			name = "TaskFloatCompleted", -- card border
			fg = C.grey_1,
			ctermfg = 4,
			ops = {},
		},
		{
			name = "KanbanTitle",
			ops = {
				bold = true,
			},
		},
		{
			name = "ListTitle",
			ops = {
				bold = true,
			},
		},
		{
			name = "TaskCompleted",
			ops = {
				fg = C.grey_1,
				ctermfg = 240,
				bold = false,
			},
		},
		{
			name = "TaskTitle",
			ops = {
				bold = true,
			},
		},
		{
			name = "TaskDue",
			ops = {
				fg = C.blue_4,
				ctermfg = 25,
			},
		},
		{
			name = "TaskDueToday",
			ops = {
				bg = C.blue_3,
				ctermbg = 67,
			},
		},
		{
			name = "TaskDueDead",
			ops = {
				bg = C.lock,
				ctermbg = 226,
			},
		},
		{
			name = "TaskDueSoon",
			ops = {
				fg = C.blue_4,
				ctermfg = 25,
				bold = true,
			},
		},
		{
			name = "TaskTag",
			ops = {
				fg = C.gold,
				ctermfg = 221,
			},
		},
	},
})
vim.keymap.set("n", "<leader>k", ":KanbanOpen ~/testboard/kanban2.md<CR>")
