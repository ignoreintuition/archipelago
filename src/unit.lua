function initUnit(spr, x, y)
  local u = {}
  u.type = unit
  u.desc = spriteDesc[spr]
  u.subType = spr
  u.lvl = 0
  u.spr = sprites[spr]
  u.x = x
  u.y = y
  u.tx = x
  u.ty = y
  u.active = false
  u.sel = false
  if u.spr == sprites["ship"] then
    u.terr = land
  elseif u.spr == sprites["troop"] then
    u.terr = water
  end
  return u
end

function updateUnit(u)
  u.spr = animate(u)
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
  u.sel = true
  return mMode
end

function moveUnit(u, x, y)
  if fget(u.spr, u.terr) == fget(mget(x, y), u.terr) then
    u.tx = x
    u.ty = y
    u.active = true
    return true
  end
  return false
end

function upgradeUnit(u)
  u.lvl = u.lvl + 1
end

function unitDialog(u)
  dialog(
    "unit info", {
      "terr " .. u.terr,
      u.subType,
      "coord (" .. u.x .. ", " .. u.y .. ")",
      u.desc
    }, "lg"
  )
end

function canTravel(u, x, y)
  return fget(u.spr, u.terr) == fget(mget(x, y), u.terr)
end