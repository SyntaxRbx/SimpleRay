--[=[
    @type RaycastOptions {Origin: Vector3, Direction: Vector3, Params: {IgnoreWater: boolean?, Blacklist: table?}?, MaxParts: number?, IgnoreCollideOffParts: boolean?, IgnoreTransparency: NumberRange?, CustomFilter: (inst: Instance) -> ()?, Visualize: boolean?}
    @within SimpleRay

    The raycast options. raycast options are used for the constructor.
]=]
type RaycastOptions = {
	Origin: Vector3,
	Direction: Vector3,
	Params: {
		IgnoreWater: boolean?,
		Blacklist: table?
	}?,
	MaxParts: number?,
	IgnoreCollideOffParts: boolean?,
	IgnoreTransparency: NumberRange?,
	CustomFilter: (inst: Instance) -> ()?,
	Visualize: boolean?
}

--[=[
	@interface Result
	@within SimpleRay
	.Distance number
	.Position Vector3
	.Normal Vector3
	.Instances table
]=]

local RaycastUtil = require(script.Library.RaycastUtil)
local SafeProperty = require(script.Library.SafeProperty)
local TableUtil = require(script.Vendor.RbxUtil.TableUtil)
local Errors = require(script.Errors)
local Config = require(script.Config)

local _error = error
local function error(errName: string)
	if Errors[errName] then
		_error(Errors[errName], 2)
	end
end

local DebugFolder = Instance.new("Folder")
DebugFolder.Name = "SimpleRayDebug"
DebugFolder.Parent = workspace.Terrain

--[=[
    @class SimpleRay

    This is the SimpleRay class.
]=]
local SimpleRay = {}
SimpleRay.__index = SimpleRay
SimpleRay.Config = Config

local DefaultOptions = {
	Origin = nil,
	Direction = nil,
	Params = {
		IgnoreWater = false,
		Blacklist = {}
	},
	MaxParts = 1,
	IgnoreCollideOffParts = false,
	IgnoreTransparency = nil,
	CustomFilter = nil,
	Visualize = false
}

--[=[
    @prop Origin Vector3
    @within SimpleRay

    The ray origin.
]=]
--[=[
    @prop Direction Vector3
    @within SimpleRay

    The ray direction.
]=]
--[=[
    @prop Params table?
    @within SimpleRay

    The ray parameters.
]=]
--[=[
    @prop MaxParts number?
    @within SimpleRay

    The maximum amount of parts the ray can hit before sending the result.
]=]
--[=[
    @prop IgnoreCollideOffParts boolean?
    @within SimpleRay

    Whether or not the ray should ignore parts with their CanCollide property set to false.
]=]
--[=[
    @prop IgnoreTransparency NumberRange?
    @within SimpleRay

    Parts the ray touches must have their transparency between this range to be ignored.
]=]
--[=[
    @prop CustomFilter (inst: Instance) -> ()?
    @within SimpleRay

    A function deciding whether or not a part should be ignored. If the function returns true, the part won't be ignored.
]=]
--[=[
    @prop Visualize boolean?
    @within SimpleRay

    Whether or not the ray should be visible. Config.Visualize will override this parameter if set to false.
]=]

--[=[
    This is the SimpleRay constructor.

    @param raycastOptions RaycastOptions
]=]
function SimpleRay.new(raycastOptions: RaycastOptions)
	local self = {}
	self.Origin = raycastOptions.Origin or DefaultOptions.Origin
	self.Direction = raycastOptions.Direction or DefaultOptions.Direction
	self.Params = raycastOptions.Params or DefaultOptions.Params
	self.MaxParts = raycastOptions.MaxParts or DefaultOptions.MaxParts
	self.IgnoreCollideOffParts = raycastOptions.IgnoreCollideOffParts or DefaultOptions.IgnoreCollideOffParts
	self.IgnoreTransparency = raycastOptions.IgnoreTransparency or DefaultOptions.IgnoreTransparency
	self.CustomFilter = raycastOptions.CustomFilter or DefaultOptions.CustomFilter
	self.Visualize = raycastOptions.Visualize or DefaultOptions.Visualize

	self.Params.IgnoreWater = self.Params.IgnoreWater or DefaultOptions.Params.IgnoreWater
	self.Params.Blacklist = self.Params.Blacklist or DefaultOptions.Params.Blacklist

	if Config.Debug then
		warn("CASTING_RAY: " .. tick())
	end

	setmetatable(self, SimpleRay)

	local filterCheck = SimpleRay.GetFilterCheck({
		{raycastOptions.IgnoreCollideOffParts, function(inst: Instance)
			return SafeProperty:GetCanCollide(inst)
		end},
		{raycastOptions.IgnoreTransparency, function(inst: Instance)
			local transparency = SafeProperty:GetTransparency(inst)
			return transparency < self.IgnoreTransparency.Min or transparency > self.IgnoreTransparency.Max
		end},
		{raycastOptions.CustomFilter, raycastOptions.CustomFilter}
	})

	local visualize = if Config.VisualizeRays then true else self.Visualize

	local raycastResult = RaycastUtil:Cast(self.Origin, self.Direction, self.MaxParts, self.Params, filterCheck, visualize)
	if raycastResult.RaycastResult then
		self.Result = {}
		self.Result.Distance = raycastResult.RaycastResult.Distance
		self.Result.Position = raycastResult.RaycastResult.Position
		self.Result.Normal = raycastResult.RaycastResult.Normal
		self.Result.Instances = raycastResult.Parts
	end

	if Config.Debug then
		warn("DONE_CASTING_RAY: " .. tick())
	end

	return self
end

function SimpleRay.GetFilterCheck(checks: table)
	local filterChecks = {}
	for _, filterCheckData in ipairs(checks) do
		if filterCheckData[1] then
			table.insert(filterChecks, filterCheckData[2])
		end
	end

	local function filterCheck(inst: Instance)
		for i, filter in ipairs(filterChecks) do
			if not filter(inst) then
				return false
			end
		end
		return true
	end

	return filterCheck
end

--[=[
	@return table

	Returns the SimpleRay [result](https://syntaxrbx.github.io/SimpleRay/api/SimpleRay#Result). Similar to [RaycastResult](https://create.roblox.com/docs/reference/engine/datatypes/RaycastResult).
]=]
function SimpleRay:GetResult()
	return self.Result
end

--[=[
	@return table

	Returns an array of instances with the same name.
]=]
function SimpleRay:FindInstancesWithName(name: string)
	local instances = {}
	for i, inst in ipairs(self.Result.Instances) do
		if inst.Name == name then
			table.insert(instances, inst)
		end
	end
	return instances
end

return SimpleRay