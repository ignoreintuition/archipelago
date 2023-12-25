currTb = "main"
toolbars = {}
toolbars.main = {
  { "build house", 48 },
  { "build farm", 49 },
  { "build mine", 50 },
  { "barracks", 53 },
  { "build port", 25},
  { "cancel", 52 }
}

toolbars.house = {
  { "destroy", 51 },
  { "cancel", 52 }
}
toolbars.farm = {
  { "harvest", 49 },
  { "destroy", 51 },
  { "cancel", 52 }
}
toolbars.barracks = {
  { "train", 53 },
  { "destroy", 51 },
  { "cancel", 52 }
}
toolbars.mine = {
  { "mine ore", 50 },
  { "destroy", 51 },
  { "cancel", 52 }
}
toolbars.port = {
  { "build", 19 },
  { "destroy", 51 },
  { "cancel", 52 }
}

function initToolbar()
  activeAction = 0
  toolbarActive = false
end

function setToolbarActive(val, tb)
  toolbarActive = val
  if (val) currTb = tb
end

function drawToolbar()
  if toolbarActive then
    local x = mapX * 8 + 36
    local y = mapY * 8 + 64
    rect(x - 1, y - 1, x + 49, y + 17, 13)
    rectfill(x, y, x + 48, y + 16, 0)

    for i, v in ipairs(toolbars[currTb]) do
      spr(toolbars[currTb][i][2], x + (i - 1) * 8, y)
    end
    print(toolbars[currTb][activeAction + 1][1], x + 2, y + 10, 7)
  end
end

function showToolbar()
  tbx = mapX * 8 + 36 + 8 * activeAction
  tby = mapY * 8 + 64
  rect(tbx, tby, tbx + 8, tby + 8, 5)
  if btnp(0) then
    activeAction = (activeAction - 1) % count(toolbars[currTb])
  elseif btnp(1) then
    activeAction = (activeAction + 1) % count(toolbars[currTb])
  elseif btnp(4) then
    if (currTb == "main") mainTb()
    if (currTb == "house") houseTb()
    if (currTb == "farm") farmTb()
    if (currTb == "mine") mineTb()
    if (currTb == "barracks") barracksTb()
    -- if (currTb == "port") portTb()
  elseif btnp(5) then
    setToolbarActive(false)
    mode = sMode
  end
end

function mainTb()
  if activeAction == 0 then
    addSprite({ "house", c.x, c.y })
  elseif activeAction == 1 then
    addSprite({ "farm", c.x, c.y })
  elseif activeAction == 2 then
    addSprite({ "mine", c.x, c.y })
  elseif activeAction == 3 then
    addSprite({ "barracks", c.x, c.y })
  elseif activeAction == 4 then
  end
  cleanUpTb()
end

function houseTb()
  if activeAction == 0 then
    destroySprite(c.x, c.y)
  elseif activeAction == 1 then
  end
  cleanUpTb()
end

function farmTb()
  if activeAction == 0 then
    food = food + 1
  elseif activeAction == 1 then
    destroySprite(c.x, c.y)
  elseif activeAction == 2 then
  end
  cleanUpTb()
end

function mineTb()
  if activeAction == 0 then
    ore = ore + 1
  elseif activeAction == 1 then
    destroySprite(c.x, c.y)
  elseif activeAction == 2 then
  end
  cleanUpTb()
end

function barracksTb()
  if activeAction == 0 then
    addSprite({ "troop", c.x, c.y })
  elseif activeAction == 1 then
    destroySprite(c.x, c.y)
  elseif activeAction == 2 then
  end
  cleanUpTb()
end

function cleanUpTb() 
  setToolbarActive(false)
  activeAction = 0
  mode = sMode
end