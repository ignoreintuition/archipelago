function initUnit(spr, x, y)
  local u = {
    type = unit,
    desc = spriteDesc[spr],
    subType = spr,
    lvl = 0,
    spr = sprites[spr],
    x = x,
    y = y,
    tx = x,
    ty = y,
    active = false,
    sel = false,
    queueForUpdate = false,
    queueForDecomm = false
  }
  if u.spr == sprites["ship"] then
    u.terr = water
  elseif u.spr == sprites["troop"] then
    u.terr = land
  end
  return u
end

function updateUnit(u)
  u.spr = animate(u)
  if d["resolved"] and u["queueForUpdate"] then
    mode = modes["select"]
    u["queueForUpdate"] = false
    u.lvl = u.lvl + 1
  elseif not d["active"] and u["queueForUpdate"] then
    mode = modes["select"]
    u["queueForUpdate"] = false
  end
  if d["resolved"] and u["queueForDecomm"] then
    u["queueForDecomm"] = false
    destroySprite(u.x, u.y)
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
        mode = modes["select"]
        return false
      end
    end
  end
  if fget(u.spr, u.terr) == fget(mget(x, y), u.terr) then
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
  u["queueForDecomm"] = true
  mode = modes["dialog"]
end

function unitDialog(u)
  dialog(
    "unit info", {
      "terr " .. u.terr,
      "level: " .. u.lvl,
      u.subType,
      "coord (" .. u.x .. ", " .. u.y .. ")",
      u.desc
    }, "lg"
  )
end

function canTravel(u, x, y)
  return fget(u.spr, u.terr) == true and fget(mget(x, y), u.terr) == true
end