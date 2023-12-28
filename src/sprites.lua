activeSprites = {}

function initSprites(sSprites)
  for i, v in ipairs(sSprites) do
    addSprite(v)
  end
end

function updateSprites()
  for i, v in ipairs(activeSprites) do
    if v.type == unit then
      updateUnit(v)
    elseif v.type == building then
      updateBuilding(v)
    end
  end
end

function drawSprites()
  for i, v in ipairs(activeSprites) do
    if v.type == unit then
      drawUnit(v)
    else
      drawBuilding(v)
    end
  end
end

function selectSprite(x, y)
  for i, v in ipairs(activeSprites) do
    if v.type == unit then
      if v.x == x and v.y == y then
        return selectUnit(v)
      end
    elseif v.type == building then
      if v.x == x and v.y == y then
        return selectBuilding(v)
      end
    end
  end
  return false
end

function getSpriteInfo(x, y)
  for i, v in ipairs(activeSprites) do
    if v.type == unit or v.type == building then
      if v.x == x and v.y == y then
        return v
      end
    end
  end
  return {}
end

function moveSprite(x, y)
  for i, v in ipairs(activeSprites) do
    if v.sel and v.type == unit then
      local res = moveUnit(v, x, y)
      v.sel = not res
      return res
    end
  end
end

function addSprite(v)
  if v[1] == "ship" or v[1] == "troop" then
    add(activeSprites, initUnit(v[1], v[2], v[3]))
    mode = modes["select"]
  else
    add(activeSprites, initBuilding(v[1], v[2], v[3]))
    mode = modes["select"]
  end
end

function destroySprite(x, y)
  for i, v in ipairs(activeSprites) do
    if v.type == building then
      if v.x == x and v.y == y then
        local explosion = 32
        del(activeSprites, v)
        while explosion <= 34 do
          spr(explosion, x, y)
          explosion = explosion + 1
        end
        mode = modes["select"]
        return true
      end
    end
  end
  mode = modes["select"]
  return false
end

function upgradeSprite(x, y)
  -- TODO accept / cancel upgrade
  for i, v in ipairs(activeSprites) do
    if v.type == building then
      if v.x == x and v.y == y then
        upgradeBuilding(v)
        return true
      end
    end
  end
  mode = modes["select"]
  return false
end