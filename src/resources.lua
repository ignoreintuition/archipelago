productionResource = {
  farm = "food",
  mine = "ore",
  house = "none",
  port = "none",
  barracks = "none",
  storage = "none",
  woodmill = "wood",
  waystation = "none"
}

maxResource = 20

function initResources()
  resource = {
    wood = 4,
    food = 10,
    ore = 0,
    gold = 0
  }
  production = {
    wood = 0,
    food = 0,
    ore = 0,
    gold = 0
  }

  subscribeToMessage(
    "exhaust", "day",
    function()
      for i, v in ipairs(activeSprites) do
        if v.foodCost then
          resource.food = resource.food - v.foodCost
        end
      end
    end
  )
  subscribeToMessage(
    "production", "day",
    function()
      for i, v in ipairs(activeSprites) do
        if v.type == building and v.production.type ~= "none" then
          if checkStorage() then
            resource[v.production.type] += v.production.output
          end
        end
      end
    end
  )
end

function checkStorage()
  local curr = 0
  for k, v in pairs(resource) do
    curr = curr + v
  end
  if curr >= maxResource then
    return false
  end
  return true
end