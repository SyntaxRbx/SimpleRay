local SafeProperty = {}

function SafeProperty:GetProperty(inst: Instance, prop: string)
	local success, value = pcall(function()
		return inst[prop]
	end)
	
	if success then
		return value
	end
end

function SafeProperty:GetCanCollide(inst: Instance)
	local canCollide = self:GetProperty(inst, "CanCollide")
	return if canCollide ~= nil then canCollide else true
end

function SafeProperty:GetTransparency(inst: Instance)
	local transparency = self:GetProperty(inst, "Transparency")
	return if transparency ~= nil then transparency else 0
end

return SafeProperty