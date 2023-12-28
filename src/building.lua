function initBuilding(spr, x, y)
  local b = {
    sel = false,
    spr = sprites[spr],
    type = building,
    subType = spr,
    x = x,
    y = y,
    active = false,
    lvl = 0,
    description = spriteDesc[spr]
  }
  return b
end

function drawBuilding(b)
  spr(b.spr, b.x * 8, b.y * 8)
end

function updateBuilding(b)
end

function upgradeBuilding(b)
  dialog(
    "upgrade",
    { "cost:\ntwo wood" },
    "sm"
  )
  mode = modes["dialog"]
  b.lvl = b.lvl + 1
end

function selectBuilding(b)
  setToolbarActive(true, b.subType)
  prevMode = mode
  mode = modes["toolbar"]
  return true
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