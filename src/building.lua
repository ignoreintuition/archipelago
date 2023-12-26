function initBuilding(spr, x, y)
  local b = {}
  b.sel = false
  b.spr = sprites[spr]
  b.type = building
  b.subType = spr
  b.x = x
  b.y = y
  b.active = false
  b.lvl = 0
  b.description = spriteDesc[spr]
  if spr == "farm" then
    food = food + 1
  end
  return b
end

function drawBuilding(b)
  spr(b.spr, b.x * 8, b.y * 8)
end

function updateBuilding(b)
end

function upgradeBuilding(b)
  b.lvl = b.lvl + 1;
end

function selectBuilding(b)
  setToolbarActive(true, b.subType)
  return tMode
end

function buildingDialog(b)
  dialog(
    "building info", {
      b.subType,
      "level: " .. b.lvl,
      "coord (" .. b.x .. ", " .. b.y .. ")",
      b.description
    },
    "lg"
  )
end