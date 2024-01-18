function _init()
  frame = { 2, 3 }
  paused = false
  maxX = 127
  maxY = 63

  water = 0
  land = 1
  beach = 4
  mountain = 5
  forest = 6
  building = 1
  unit = 2

  day = 0

  sprites = {
    ship = 19,
    citizen = 22,
    troop = 39,
    house = 21,
    farm = 24,
    port = 25,
    mine = 26,
    barracks = 29,
    port = 30,
    storage = 31,
    woodmill = 35,
    waystation = 37
  }
  spriteDesc = {
    ship = "travels by sea. \ncan carry cargo \nor passengers.",
    troop = "travels by land. \nrequires 1 food.",
    house = "houses families.",
    farm = "provides food. \nrequires farmers.",
    port = "build Ships. \nload / unload goods.",
    mine = "harvest ore",
    barracks = "train peasants \nto fight.",
    woodmill = "gather wood.",
    waystation = "waypoint between \ntrade routes",
    storage = "allows you to store \nadditional goods."
  }
  modes = {
    select = 1,
    move = 2,
    toolbar = 3,
    dialog = 4
  }
  gameState = {
    title = 1,
    game = 2,
    over = 3
  }
  state = gameState["title"]
  initTitle()
  initMap()
  initBroker()
  initResources()
  initSprites({ { "ship", 1, 1 }, {"citizen", 4, 1} })
  initEnemy()
  initUi()
  initToolbar()
  initTimers()
  printStats()
  initGoals()
end

function _update()
  if state == gameState["title"] then
    updateTitle()
  else
    updateMap()
    updateSprites()
    updateEnemy()
    updateUi()
    updateTimers()
    updateGoals()
  end
end

function _draw()
  if state == gameState["title"] then
    drawTitle()
  else
    drawMap()
    drawSprites()
    drawEnemy()
    drawToolbar()
    drawDialog()
    drawUi()
    drawGoals()
  end
end

function printStats()
  printh("\n\n-==ARCHIPELAGO==-\nby IgnoreIntuition\nLocked and stocked")
  printh(stat(93) .. ":" .. stat(94) .. ":" .. stat(95))
  printh("mem usage: " .. stat(0))
  printh("CPU: " .. stat(1))
end