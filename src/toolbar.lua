function initToolbar(toolbar)
  tb = toolbar
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
    rect(x - 1, y - 1, x + 49, y + 17, 13)
    rectfill(x, y, x + 48, y + 16, 0)

    for i, v in ipairs(tb) do
      spr(tb[i][2], x + (i - 1) * 8, y)
    end
    print(tb[activeAction + 1][1], x + 2, y + 10, 7)
  end
end

function showToolbar()
  tbx = mapX * 8 + 36 + 8 * activeAction
  tby = mapY * 8 + 64
  rect(tbx, tby, tbx + 8, tby + 8, 5)
  if btnp(0) then
    activeAction = (activeAction - 1) % count(tb)
  elseif btnp(1) then
    activeAction = (activeAction + 1) % count(tb)
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
    addSprite({ barracks, c.x, c.y })
  elseif activeAction == 4 then
    printh('boom')
  elseif activeAction == 5 then
  end
  setToolbarActive(false)
  activeAction = 0
  mode = sMode
end