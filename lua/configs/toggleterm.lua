require('toggleterm').setup({
	open_mapping = [[<F12>]],
	shade_terminals = false,
	size = function(term)
		if term.direction == 'horizontal' then
			return vim.o.lines * 0.4
		elseif term.direction == 'vertical' then
			return vim.o.columns * 0.4
		end
	end
})
