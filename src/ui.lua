function initUi()
  mode = 1
  c = {}
  c.x = 0
  c.y = 0
  c.w = 8
  c.h = 8
end

function updateUi()
  newX = c.x
  newY = c.y
  if (btnp(0)) newX = newX - 1
  if (btnp(1)) newX = newX + 1
  if (btnp(2)) newY = newY - 1
  if (btnp(3)) newY = newY + 1
  c.x = mid(0, newX, 127)
  c.y = mid(0, newY, 63)
end

function drawUi()
  if mode == 1 or mode == 2 then
    rect(c.x * 8, c.y * 8, c.x * 8 + c.w, c.y * 8 + c.h, 5)
    if btn(4) then
      local spr = getSpriteInfo(c.x, c.y)
      if spr then
        dialog("unit info", { "terr " .. spr.terr, "spr " .. spr.spr, "coord (" .. spr.x .. ", " .. spr.y .. ")" }, "lg")
      else
        local tile = getTileInfo(c.x, c.y)
        dialog("tile info", { "tile " .. tile.terr, "coord (" .. c.x .. ", " .. c.y .. ")" }, "lg")
      end
    end
    if btnp(5) then
      action(c.x, c.y)
    end
  elseif mode == 3 then
    if btnp(5) or btnp(4) then
      setToolbarActive(false)
      mode = 1
    end
  end
end

function action(x, y)
  if mode == 1 then
    if selectSprite(x, y) then
      mode = 2
    else
      setToolbarActive(true)
      mode = 3
    end
  elseif mode == 2 then
    if moveSprite(x, y) then
      mode = 1
    else
      sfx(0)
    end
  elseif mode == 3 then
  end
end