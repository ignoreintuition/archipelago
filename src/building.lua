function initBuilding(spr, x, y)
  local b = {}
  b.sel = false
  b.spr = sprites[spr]
  b.type = building
  b.subType = spr
  b.x = x
  b.y = y
  b.active = false
  if b.spr == farm then
    food = food + 1
  end
  return b
end

function drawBuilding(b)
  spr(b.spr, b.x * 8, b.y * 8)
end

function updateBuilding(b)
end

function selectBuilding(b)
  setToolbarActive(true, b.subType)
  return tMode
end