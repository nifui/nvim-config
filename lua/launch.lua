LAZY_PLUGIN_SPEC = {}

function spec(item)
	local ok, result = pcall(require, item)
	if not ok then
		vim.notify("Error requiring " .. item .. ": " .. result, vim.log.levels.ERROR)
		return
	end

	if type(result) ~= "table" or not result[1] then
		vim.notify("⚠️ Invalid plugin spec in " .. item .. ": missing plugin name", vim.log.levels.WARN)
	end

	table.insert(LAZY_PLUGIN_SPEC, { import = item })
end
