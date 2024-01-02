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

maxResource = 99

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
          resource[k] = production[k] + resource[k]
          if resource[k] > maxResource then
             resource[k] = maxResource
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