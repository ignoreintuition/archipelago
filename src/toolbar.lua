function initToolbar()
  activeAction = 0
  toolbarActive = false
end

function setToolbarActive(val)
  toolbarActive = val
end

function drawToolbar()
  if toolbarActive then
    local x = mapX * 8 + 36
    local y = mapY * 8 + 64
    rectfill(x, y, x + 48, y + 16, 0)
    spr(48, x, y)
    spr(49, x + 8, y)
    spr(50, x + 16, y)
    spr(53, x + 24, y)
    spr(51, x + 32, y)
    spr(52, x + 40, y)
    print(activeAction, x + 2, y + 10, 7)
  end
end

function showToolbar()
  tbx = mapX * 8 + 36 + 8 * activeAction
  tby = mapY * 8 + 64
  rect(tbx, tby, tbx + 8, tby + 8, 5)
  if btnp(0) then
    activeAction = (activeAction - 1) % 6
  elseif btnp(1) then
    activeAction = (activeAction + 1) % 6
  elseif btnp(4) then
    addBuilding()
  elseif btnp(5) then
    setToolbarActive(false)
    mode = sMode
  end
end

function addBuilding()
  if activeAction == 0 then
    addSprite({ house, c.x, c.y })
  elseif activeAction == 1 then
    addSprite({ farm, c.x, c.y })
  elseif activeAction == 2 then
    addSprite({ mine, c.x, c.y })
  elseif activeAction == 3 then
    printh('boom')
  elseif activeAction == 4 then
  end
  setToolbarActive(false)
  activeAction = 0
  mode = sMode
end