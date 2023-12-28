toolbars = {
  current = "main",
  width = 36,
  height = 64,
  main = {
    { "build house", 48 },
    { "build farm", 49 },
    { "build mine", 50 },
    { "barracks", 53 },
    { "build port", 25 },
    { "cancel", 52 }
  },
  house = {
    { "upgrade", 58 },
    { "destroy", 51 },
    { "cancel", 52 }
  },
  farm = {
    { "harvest", 49 },
    { "upgrade", 58 },
    { "destroy", 51 },
    { "cancel", 52 }
  },
  barracks = {
    { "train", 53 },
    { "upgrade", 58 },
    { "destroy", 51 },
    { "cancel", 52 }
  },
  mine = {
    { "mine ore", 50 },
    { "upgrade", 58 },
    { "destroy", 51 },
    { "cancel", 52 }
  },
  port = {
    { "build", 19 },
    { "upgrade", 58 },
    { "destroy", 51 },
    { "cancel", 52 }
  }
}

function initToolbar()
  activeAction = 0
  toolbarActive = false
end

function setToolbarActive(val, tb)
  toolbarActive = val
  if (val) toolbars["current"] = tb
end

function drawToolbar()
  if toolbarActive then
    local x = mapX * 8 + toolbars["width"]
    local y = mapY * 8 + toolbars["height"]
    rect(x - 1, y - 1, x + 49, y + 17, 13)
    rectfill(x, y, x + 48, y + 16, 0)

    for i, v in ipairs(toolbars[toolbars["current"]]) do
      spr(toolbars[toolbars["current"]][i][2], x + (i - 1) * 8, y)
    end
    print(toolbars[toolbars["current"]][activeAction + 1][1], x + 2, y + 10, 7)
  end
end

function showToolbar()
  tbx = mapX * 8 + toolbars["width"] + 8 * activeAction
  tby = mapY * 8 + toolbars["height"]
  rect(tbx, tby, tbx + 8, tby + 8, 5)
  if btnp(⬅️) then
    activeAction = (activeAction - 1) % count(toolbars[toolbars["current"]])
  elseif btnp(➡️) then
    activeAction = (activeAction + 1) % count(toolbars[toolbars["current"]])
  elseif btnp(🅾️) then
    if toolbars["current"] == "main" then
      mainTb()
    elseif toolbars["current"] == "house" then
      houseTb()
    elseif toolbars["current"] == "farm" then
      farmTb()
    elseif toolbars["current"] == "mine" then
      mineTb()
    elseif toolbars["current"] == "barracks" then
      barracksTb()
    elseif toolbars["current"] == "port" then
      portTb()
    end
  elseif btnp(❎) then
    setToolbarActive(false)
    mode = modes["select"]
  end
end
-- TODO Optimize toolbar generation

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
    addSprite({ "port", c.x, c.y })
  elseif activeAction == 5 then
    mode = modes["select"]
  end
  cleanUpTb()
end

function houseTb()
  if activeAction == 0 then
    upgradeSprite(c.x, c.y)
  elseif activeAction == 1 then
    destroySprite(c.x, c.y)
  elseif activeAction == 2 then
    mode = modes["select"]
  end
  cleanUpTb()
end

function farmTb()
  if activeAction == 0 then
    resource["food"] = resource["food"] + 1
    mode = modes["select"]
  elseif activeAction == 1 then
    upgradeSprite(c.x, c.y)
  elseif activeAction == 2 then
    destroySprite(c.x, c.y)
  elseif activeAction == 3 then
    mode = modes["select"]
  end
  cleanUpTb()
end

function mineTb()
  if activeAction == 0 then
    resource["ore"] = resource["ore"] + 1
    mode = modes["select"]
  elseif activeAction == 1 then
    upgradeSprite(c.x, c.y)
  elseif activeAction == 2 then
    destroySprite(c.x, c.y)
  elseif activeAction == 3 then
    mode = modes["select"]
  end
  cleanUpTb()
end

function barracksTb()
  if activeAction == 0 then
    addSprite({ "troop", c.x, c.y })
  elseif activeAction == 1 then
    upgradeSprite(c.x, c.y)
  elseif activeAction == 2 then
    destroySprite(c.x, c.y)
  elseif activeAction == 3 then
    mode = modes["select"]
  end
  cleanUpTb()
end

function portTb()
  if activeAction == 0 then
    addSprite({ "ship", c.x, c.y })
  elseif activeAction == 1 then
    upgradeSprite(c.x, c.y)
  elseif activeAction == 2 then
    destroySprite(c.x, c.y)
  elseif activeAction == 3 then
    mode = modes["select"]
  end
  cleanUpTb()
end

function cleanUpTb()
  setToolbarActive(false)
  activeAction = 0
end