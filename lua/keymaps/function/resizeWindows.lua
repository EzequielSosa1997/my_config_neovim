local startWidth = 30

function sumWindow()
	if startWidth > 80 then
		return print("LIMIT MAX")
	end
	startWidth = startWidth + 10
	vim.cmd("vertical resize " .. tostring(startWidth))
end

function restWindow()
	if startWidth < 15 then
		return print("LIMIT MIN")
	end
	startWidth = startWidth - 10
	vim.cmd("vertical resize " .. tostring(startWidth))
end

return startWidth
