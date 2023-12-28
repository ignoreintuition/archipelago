function initUi()
  mode = modes["select"]
  prevMode = modes["select"]
  c = {
    x = 0,
    y = 0,
    w = 8,
    h = 8
  }
end

function updateUi()
  if mode == modes["select"] or mode == modes["move"] then
    newX = c.x
    newY = c.y
    if btnp(⬅️) then
      newX = newX - 1
    end
    if btnp(➡️) then
      newX = newX + 1
    end
    if btnp(⬆️) then
      newY = newY - 1
    end
    if btnp(⬇️) then
      newY = newY + 1
    end
    c.x = mid(0, newX, maxX)
    c.y = mid(0, newY, maxY)
  end
end

function drawUi()
  drawOverlay()
  drawSelector()
end

function drawSelector()
  if mode == modes["select"] then
    rect(c.x * 8, c.y * 8, c.x * 8 + c.w, c.y * 8 + c.h, 5)
    if btnp(🅾️) then
      prevMode = mode
      infoDialog()
    end
    if btnp(❎) then
      local isSprite = selectSprite(c.x, c.y)
      if not isSprite and not isTile("water", c.x, c.y) then
        prevMode = mode
        setToolbarActive(true, "main")
        mode = modes["toolbar"]
      end
    end
  elseif mode == modes["toolbar"] then
    showToolbar()
  elseif mode == modes["dialog"] then
    if btnp(🅾️) or btnp(❎) then
      resetDialog()
      mode = prevMode
    end
  elseif mode == modes["move"] then
    rect(c.x * 8, c.y * 8, c.x * 8 + c.w, c.y * 8 + c.h, 5)
    if btnp(❎) then
      if moveSprite(c.x, c.y) then
        mode = modes["select"]
      else
        sfx(0)
      end
    end
  end
end

function infoDialog()
  mode = modes["dialog"]
  local spr = getSpriteInfo(c.x, c.y)
  if spr.type == unit then
    unitDialog(spr)
  elseif spr.type == building then
    buildingDialog(spr)
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
  print(resource["wood"], (x + 5) * 8 + 2, y + 1, 15)
  spr(55, (x + 7) * 8, y)
  print(resource["food"], (x + 8) * 8 + 2, y + 1, 15)
  spr(56, (x + 10) * 8, y)
  print(resource["ore"], (x + 11) * 8 + 2, y + 1, 15)
  spr(57, (x + 13) * 8, y)
  print(resource["gold"], (x + 14) * 8 + 2, y + 1, 15)
end