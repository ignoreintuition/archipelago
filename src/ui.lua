function initUi()
  mode = 1
  c = {}
  c.x = 0
  c.y = 0
  c.w = 8
  c.h = 8
end

function updateUi()
  if mode == sMode or mode == mMode then
    newX = c.x
    newY = c.y
    if btnp(0) then
      newX = newX - 1
    end
    if btnp(1) then
      newX = newX + 1
    end
    if btnp(2) then
      newY = newY - 1
    end
    if btnp(3) then
      newY = newY + 1
    end
    c.x = mid(0, newX, 127)
    c.y = mid(0, newY, 63)
  end
end

function drawUi()
  drawOverlay()

  if mode == sMode or mode == mMode then
    rect(c.x * 8, c.y * 8, c.x * 8 + c.w, c.y * 8 + c.h, 5)
    if btnp(4) then
      dInfo()
    end
    if btnp(5) then
      action(c.x, c.y)
    end
  elseif mode == tMode then
    showToolbar()
  elseif mode == dMode then
    if btnp(4) or btnp(5) then
      resetDialog()
      mode = 1
    end
  end
end

function action(x, y)
  if mode == sMode then
    mode = selectSprite(x, y)
    if not mode then
      setToolbarActive(true)
      mode = tMode
    end
  elseif mode == mMode then
    if moveSprite(x, y) then
      mode = sMode
    else
      sfx(0)
    end
  end
end

function dInfo()
  mode = dMode
  local spr = getSpriteInfo(c.x, c.y)
  if spr.type == unit then
    dialog("unit info", { "terr " .. spr.terr, "spr " .. spr.spr, "coord (" .. spr.x .. ", " .. spr.y .. ")" }, "lg")
  elseif spr.type == building then
    dialog("building info", { "spr " .. spr.spr, "coord (" .. spr.x .. ", " .. spr.y .. ")" }, "lg")
  else
    local tile = getTileInfo(c.x, c.y)
    dialog("tile info", { "tile " .. tile.terr, "coord (" .. c.x .. ", " .. c.y .. ")" }, "lg")
  end
end

function drawOverlay()
  local x = mapX * 8
  local y = mapY * 8 - 8
  rectfill(x, y, x + 128, y + 7, 0)
  print("day" .. day, x, y + 1, 15)
  spr(54, (x + 4) * 8, y)
  print(wood, (x + 5) * 8 + 2, y + 1, 15)
  spr(55, (x + 7) * 8, y)
  print(food, (x + 8) * 8 + 2, y + 1, 15)
  spr(56, (x + 10) * 8, y)
  print(ore, (x + 11) * 8 + 2, y + 1, 15)
  spr(57, (x + 13) * 8, y)
  print(gold, (x + 14) * 8 + 2, y + 1, 15)
end