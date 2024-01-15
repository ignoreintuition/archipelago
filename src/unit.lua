function initUnit(spr, x, y)
  local u = {
    type = unit,
    desc = spriteDesc[spr],
    subType = spr,
    lvl = 1,
    foodCost = 1,
    spr = sprites[spr],
    x = x,
    y = y,
    tx = x,
    ty = y,
    active = false,
    sel = false,
    queueForUpdate = false,
    queueForDecomm = false,
    queuedUnits = 0,
    terr = {}
  }
  if u.spr == sprites["ship"] then
    add(u.terr, water)
    add(u.terr, beach)
  elseif u.spr == sprites["troop"] or u.spr == sprites["citizen"] then
    add(u.terr, land)
    add(u.terr, forest)
  end
  if u.subType == "citizen" or u.subType == "troop" then
    u.foodCost = u.foodCost + 1
  end
  return u
end

function updateUnit(u)
  u.spr = animate(u)
  if d["resolved"] and u["queueForUpdate"] then
    mode = modes["select"]
    u["queueForUpdate"] = false
    u.lvl = u.lvl + u.queuedUnits
    u.queuedUnits = 0
  elseif not d["active"] and u["queueForUpdate"] then
    mode = modes["select"]
    u["queueForUpdate"] = false
  end
  if d["resolved"] and u["queueForDecomm"] then
    u["queueForDecomm"] = false
    destroySprite(u.spr, u.x, u.y)
  elseif not d["active"] and u["queueForDecomm"] then
    u["queueForDecomm"] = false
  end
end

function drawUnit(u)
  if timer % 10 == 0 then
    if u.x < u.tx and canTravel(u, u.x + 1, u.y) then
      u.x += 1
    elseif u.x > u.tx and canTravel(u, u.x - 1, u.y) then
      u.x -= 1
    elseif u.y < u.ty and canTravel(u, u.x, u.y + 1) then
      u.y += 1
    elseif u.y > u.ty and canTravel(u, u.x, u.y - 1) then
      u.y -= 1
    end
  end
  spr(u.spr, u.x * 8, u.y * 8)
  if u.sel then
    if timer % 10 ~= 0 then
      rect(u.x * 8, u.y * 8, u.x * 8 + 8, u.y * 8 + 8, 7)
    end
  end
end

function selectUnit(u)
  prevMode = mode
  mode = modes["move"]
  u.sel = true
  return true
end

function moveUnit(u, x, y)
  if u.x == x and u.y == y then
    mode = modes["select"]
    return true
  end
  for i, v in ipairs(activeSprites) do
    if v.x == x and v.y == y then
      if v.type == unit then
        upgradeUnit(v, u)
        return true
      elseif v.type == building then
        assignUnit(v, u)
        return true
      elseif v.type == building then
        mode = modes["select"]
        return false
      end
    end
  end
  if canTravel(u, x, y) then
    u.tx = x
    u.ty = y
    u.active = true
    mode = modes["select"]
    return true
  end
  sfx(0)
  return false
end

function upgradeUnit(v, u)
  dialog("merge", { "combine\nunits" }, "sm")
  v["queueForUpdate"] = true
  v["queuedUnits"] = u.lvl
  u["queueForDecomm"] = true
  mode = modes["dialog"]
end

function assignUnit(v, u)
  dialog("assign", { "assign\nunits" }, "sm")
  v["queueForAssignment"] = true
  v["queuedUnits"] = u.lvl
  u["queueForDecomm"] = true
  mode = modes["dialog"]
end

function unitDialog(u)
  dialog(
    "unit info", {
      "level: " .. u.lvl,
      u.subType,
      "coord (" .. u.x .. ", " .. u.y .. ")",
      u.desc
    }, "lg"
  )
end

function canTravel(u, x, y)
  for i, v in ipairs(u.terr) do
    if fget(mget(x, y), v) == true then
      return true
    end
  end
  return false
end