function initBuilding(spr, x, y)
  local b = {}
  b.sel = false
  b.spr = spr
  b.type = building
  b.x = x
  b.y = y 
  b.active = false
  return b
end

function drawBuilding(b) 
  spr(b.spr, b.x * 8, b.y * 8)
end

function updateBuilding(b)
end

function selectBuilding(b)
  dialog("bulding info", { "Placeholder" }, "lg")
  return dMode
end