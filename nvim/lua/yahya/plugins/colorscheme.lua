function ColorMyPencils(color)
	color = color or "ron"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


return {
    --"folke/tokyonight.nvim",
    -- "sainnhe/sonokai",
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    config = function()
        ColorMyPencils("zenwritten")
    end
}
