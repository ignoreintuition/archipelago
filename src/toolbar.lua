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
    { "worker", 23, "addSprite", "citizen" },
    upgradeIcon,
    { "destroy", 51, "destroySprite", "house" },
    cancelIcon
  },
  farm = {
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
  selectSprites = {},
  boat = {
    { "disembark", 60, "disembark"},
    { "move", 59, "move"}
  }
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
      add(toolbars["selectSprites"], { "sel " .. v.subType, v.spr, "selectUnit", i })
    end
    add(toolbars["selectSprites"], cancelIcon)
  end
  if (val) toolbars["current"] = tb
end

function drawToolbar()
  if toolbarActive then
    local x = gMap.x * 8 + toolbars["width"]
    local y = gMap.y * 8 + toolbars["height"]
    rect(x - 1, y - 1, x + 49, y + 17, 13)
    rectfill(x, y, x + 48, y + 16, 0)
    for i, v in ipairs(toolbars[toolbars["current"]]) do
      spr(toolbars[toolbars["current"]][i][2], x + (i - 1) * 8, y)
    end
    print(toolbars[toolbars["current"]][activeAction + 1][1], x + 2, y + 10, 7)
  end
end

function showToolbar()
  tbx = gMap.x * 8 + toolbars["width"] + 8 * activeAction
  tby = gMap.y * 8 + toolbars["height"]
  rect(tbx, tby, tbx + 8, tby + 8, 5)
  if btnp(⬅️) then
    activeAction = (activeAction - 1) % count(toolbars[toolbars["current"]])
  elseif btnp(➡️) then
    activeAction = (activeAction + 1) % count(toolbars[toolbars["current"]])
  elseif btnp(❎) then
    setToolbarActive(false)
    toolbarFunctions[toolbars[toolbars["current"]][activeAction + 1][3]](toolbars[toolbars["current"]][activeAction + 1][4])
    cleanUpTb()
  elseif btnp(🅾️) then
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
    if arg == "troop" or arg == "citizen" then 
      local spr = addSprite({ arg, c.x, c.y })
      -- TODO check for actual cost 
    elseif resource["wood"] < 1 then
      dialog(
        "build",
        { "not enough\nwood" },
        "sm"
      )
    elseif not unitInZone(c.x, c.y) then
      dialog(
        "build",
        { "no units" },
        "sm"
      )
    else
      resource["wood"] = resource["wood"] - 1
      local spr = addSprite({ arg, c.x, c.y })
    end
  end,
  destroySprite = function(arg)
    destroySprite(sprites[arg], c.x, c.y)
  end,
  upgradeSprite = function(arg)
    upgradeSprite(c.x, c.y)
  end,
  cancel = function(arg)
    mode = modes["select"]
  end,
  harvestResource = function(arg)
    if checkStorage() then
      resource[arg] = resource[arg] + 1
      mode = modes["select"]
    else
      dialog(
        "storage",
        { "max\ncapacity" },
        "sm"
      )
      mode = modes["dialog"]
    end
  end,
  selectUnit = function(arg)
    if selActive[arg].type == unit then
      selectUnit(selActive[arg])
    elseif selActive[arg].type == building then
      selectBuilding(selActive[arg])
    end
  end,
  move = function(arg)
    local s = get𝘴prite𝘪nfo(c.x, c.y)
    prev𝘮ode = mode
    mode = modes["move"]
    s.sel = true  end,
  disembark = function(arg)
    local s = get𝘴prite𝘪nfo(c.x, c.y)
    disembark(s)
    mode = modes["select"]
  end
}