upgradeIcon = { "upgrade", 58, "upgradeSprite" }
cancelIcon = { "cancel", 52, "cancel" }
toolbars = {
  current = "buildLand",
  width = 36,
  height = 64,
  buildLand = {
    { "house", 48, "addSprite", "house" },
    { "farm", 49, "addSprite", "farm" },
    { "barracks", 53, "addSprite", "barracks" },
    { "storage", 55, "addSprite", "storage" },
    cancelIcon
  },
  buildWater = {
    { "waystation", 37, "addSprite", "waystation" },
    cancelIcon
  },
  buildBeach = {
    { "port", 25, "addSprite", "port" },
    cancelIcon
  },
  buildMountain = {
    { "build mine", 50, "addSprite", "mine" },
    cancelIcon
  },
  buildForest = {
    { "wood mill", 54, "addSprite", "woodmill" },
    cancelIcon
  },
  house = {
    upgradeIcon,
    { "destroy", 51, "destroySprite", "house" },
    cancelIcon
  },
  farm = {
    { "harvest", 49, "harvestResource", "food" },
    upgradeIcon,
    { "destroy", 51, "destroySprite", "farm" },
    cancelIcon
  },
  barracks = {
    { "train", 53, "addSprite", "troop" },
    upgradeIcon,
    { "destroy", 51, "destroySprite", "barracks" },
    cancelIcon
  },
  mine = {
    { "mine ore", 50, "harvestResource", "ore" },
    upgradeIcon,
    { "destroy", 51, "destroySprite", "mine" },
    cancelIcon
  },
  port = {
    { "build", 19, "addSprite", "ship" },
    upgradeIcon,
    { "destroy", 51, "destroySprite", "port" },
    cancelIcon
  },
  storage = {
    upgradeIcon,
    { "destroy", 51, "destroySprite", "storage" },
    cancelIcon
  },
  woodmill = {
    upgradeIcon,
    { "destroy", 51, "destroySprite", "woodmill" },
    cancelIcon
  },
  waystation = {
    upgradeIcon,
    { "destroy", 51, "destroySprite", "waystation" },
    cancelIcon
  },
  selectSprites = {}
}

function initToolbar()
  activeAction = 0
  toolbarActive = false
end

function setToolbarActive(val, tb, sel)
  toolbarActive = val
  if tb == "selectSprites" then
    selActive = sel
    for i, v in ipairs(sel) do
      add(toolbars["selectSprites"], { v.subType, v.spr, "selectUnit", i })
    end
    add(toolbars["selectSprites"], cancelIcon)
  end
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
    setToolbarActive(false)
    toolbarFunctions[toolbars[toolbars["current"]][activeAction + 1][3]](toolbars[toolbars["current"]][activeAction + 1][4])
    cleanUpTb()
  elseif btnp(❎) then
    setToolbarActive(false)
    cleanUpTb()
    mode = modes["select"]
  end
end

function cleanUpTb()
  activeAction = 0
  selActive = {}
  toolbars["selectSprites"] = {}
end

toolbarFunctions = {
  addSprite = function(arg)
    local spr = addSprite({ arg, c.x, c.y })
    if arg != "troop" and arg != "ship" then
      updateProduction(arg, 1)
    end
  end,
  destroySprite = function(arg)
    destroySprite(c.x, c.y)
    if arg != "troop" and arg != "ship" then
      updateProduction(arg, -1)
    end
  end,
  upgradeSprite = function(arg)
    upgradeSprite(c.x, c.y)
  end,
  cancel = function(arg)
    mode = modes["select"]
  end,
  harvestResource = function(arg)
    resource[arg] = resource[arg] + 1
    mode = modes["select"]
  end,
  selectUnit = function(arg)
    if selActive[arg].type == unit then
      selectUnit(selActive[arg])
    elseif selActive[arg].type == building then
      selectBuilding(selActive[arg])
    end
  end
}