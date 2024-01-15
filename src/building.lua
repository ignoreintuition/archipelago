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
    labor = {
      cost = 0,
      current = 0
    },
    production = {
      output = 0,
      type = "none"
    },
    description = spriteDesc[spr],
    queueForUpdate = false,
    queueForAssignment = false,
    queuedUnits = 0
  }
  if b.spr == sprites["storage"] then
    maxResource = maxResource + 10
  end
  if b.spr == sprites["farm"]
      or b.spr == sprites["mine"]
      or b.spr == sprites["port"]
      or b.spr == sprites["barracks"]
      or b.spr == sprites["woodmill"] then
    b.labor.cost = 1
  end
  if b.spr == sprites["farm"] then
    b.production.type = "food"
    b.production.output = 1
  elseif b.spr == sprites["mine"] then
    b.production.type = "ore"
    b.production.output = 1
  elseif b.spr == sprites["woodmill"] then
    b.production.type = "wood"
    b.production.output = 1
  end
  return b
end

function deleteBuilding(b)
  if b.spr == sprites["storage"] then
    maxResource = maxResource - 10
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
      resource["wood"] -= 2
      if b.labor.cost > 0 then b.labor.cost += 1 end
    else
      dialog(
        "upgrade",
        { "not enough\nwood" },
        "sm"
      )
    end
  elseif d["resolved"] and b["queueForAssignment"] then
    mode = modes["select"]
    b["queueForAssignment"] = false
    b.labor.current += b.queuedUnits
    b.production.output = b.labor.current
    b.queuedUnits = 0
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
      "labor: " .. b.labor.current .. "/" .. b.labor.cost,
      b.description
    },
    "lg"
  )
end