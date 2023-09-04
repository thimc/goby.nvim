local M = {}

M.config = {
	transparent = false,
	italics = true,
	underline = true,
}

M.setup = function(config)
  M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

M.load = function()
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end
  vim.g.colors_name = "goby"
  vim.o.termguicolors = true
	vim.cmd("syntax clear")

  local groups = require("goby.groups").setup()

  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
	end

end

return M
