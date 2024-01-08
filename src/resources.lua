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

maxResource = 10

function initResources()
  resource = {
    wood = 4,
    food = 0,
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
    "production", "day",
    function()
      for k, v in pairs(resource) do
        if checkStorage() then
          resource[k] = production[k] + resource[k]
        end
      end
    end
  )
end

function updateProduction(resource, delta)
  if productionResource[resource] != "none" then
    production[productionResource[resource]] = production[productionResource[resource]] + delta
  end
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