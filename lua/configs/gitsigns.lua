require('gitsigns').setup({
	numhl = true,
	word_diff = true,
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 200,
		virt_text_pos = 'right_align'
	}
})
