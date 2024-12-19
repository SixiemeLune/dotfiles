function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0,"Normal", { bg = "none" })
	vim.api.nvim_set_hl(0,"NormalFloat", { bg = "none" })
end

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#57CAE4', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#806DDF', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#51B3EC', bold=true })
end


ColorMyPencils()
LineNumberColors()
