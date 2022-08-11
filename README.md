<div align="center">
  <h1>SimpleRay</h1>
  <p>Simple module for raycasting on Roblox.</p>
  <a href="https://syntaxrbx.github.io/SimpleRay/"><strong>View docs →</strong></a>
</div>

## Usage

```lua
local SimpleRay = require(game.ReplicatedStorage.SimpleRay)

local origin = Vector3.new(0, 0, 0)
local direction = Vector.new(0, 1, 0)
local maxRayInstances = 2

local result = SimpleRay.new({
    Origin = origin,
    Direction = direction,
    Params = {
        IgnoreWater = true,
        Blacklist = {
            workspace.Part2
        }
    },
    MaxParts = maxRayInstances,
    IgnoreCollideOffParts = true,
    IgnoreTransparency = NumberRange.new(0.1, 1),
    CustomFilter = function(inst: Instance)
        return inst.Name ~= "Debug"
    end,
    Visualize = true
}):GetResult()

print(result)
--[[
    Example Output:
    {
        Distance = 50,
        Position = Vector3.new(12, 0, 37),
        Normal = Vector3.new(0, 1, 0),
        Instances = {
            {
                ["Instance"] = workspace.Part,
                ["Material"] = Enum.Material.Plastic,
                ["Normal"] = Vector3.new(0, 0, 1),
                ["Position"] = Vector3.new(-2, 5, -17)
            },
            {
                Instance = workspace.Baseplate,
                Material = Enum.Material.Plastic,
                Normal = Vector3.new(0, 1, 0),
                Position = Vector3.new(12, 0, 37)
            }
        }
    }
]]
```