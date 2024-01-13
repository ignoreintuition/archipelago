function initBuilding(spr, x, y)
  local b = {
    sel = false,
    spr = sprites[spr],
    type = building,
    subType = spr,
    x = x,
    y = y,
    active = false,
    lvl = 1,
    description = spriteDesc[spr],
    queueForUpdate = false
  }
  if b.spr == sprites["storage"] then
    maxResource = maxResource + 10
  end
  if b.spr == sprites["farm"]
      or b.spr == sprites["mine"]
      or b.spr == sprites["port"]
      or b.spr == sprites["barracks"]
      or b.spr == sprites["woodmill"] then
    laborCost = laborCost + 1
  end
  updateProduction(spr, 1)
  return b
end

function deleteBuilding(b)
  if b.spr == sprites["storage"] then
    maxResource = maxResource - 10
  elseif b.spr == sprites["house"] then
    foodCost = foodCost - 1
    availableLabor = availableLabor - 4
  end
end

function drawBuilding(b)
  spr(b.spr, b.x * 8, b.y * 8)
end

function updateBuilding(b)
  b.spr = animate(b)
  if d["resolved"] and b["queueForUpdate"] then
    b["queueForUpdate"] = false
    if resource["wood"] >= 2 then
      b.lvl = b.lvl + 1
      resource["wood"] = resource["wood"] - 2
    else
      dialog(
        "upgrade",
        { "not enough\nwood" },
        "sm"
      )
    end
  elseif not d["active"] and b["queueForUpdate"] then
    b["queueForUpdate"] = false
  end
end

function upgradeBuilding(b)
  dialog(
    "upgrade",
    { "cost:\ntwo wood" },
    "sm"
  )
  b["queueForUpdate"] = true
  mode = modes["dialog"]
end

function selectBuilding(b)
  setToolbarActive(true, b.subType)
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