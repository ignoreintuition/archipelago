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
    description = spriteDesc[spr],
    queueForUpdate = false
  }
  return b
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