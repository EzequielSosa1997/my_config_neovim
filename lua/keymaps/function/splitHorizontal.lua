local startHigh = 30

function sumWindowHorizotal()
	if startHigh > 80 then
		return print("LIMIT MAX")
	end
	startHigh = startHigh + 10
	vim.cmd("horizontal resize " .. tostring(startHigh))
end

function restWindowHorizotal()
	if startHigh < 15 then
		return print("LIMIT MIN")
	end
	startHigh = startHigh - 10
	vim.cmd("horizontal resize " .. tostring(startHigh))
end
return startHigh
