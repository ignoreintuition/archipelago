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
    troop = 22,
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
    barracks = "train peasants to fight.",
    woodmill = "gather wood.",
    waystation = "waypoint between trade routes",
    storage = "allows you to store \nadditional goods."
  }
  modes = {
    select = 1,
    move = 2,
    toolbar = 3,
    dialog = 4
  }

  initMap()
  initBroker()
  initSprites({ { "ship", 1, 1 } })
  initEnemy()
  initUi()
  initToolbar()
  initTimers()
  initResources()
  printStats()
end

function _update()
  updateMap()
  updateSprites()
  updateEnemy()
  updateUi()
  updateTimers()
end

function _draw()
  drawMap()
  drawSprites()
  drawEnemy()
  drawToolbar()
  drawDialog()
  drawUi()
end

function printStats()
  printh("\n\n-==ARCHIPELAGO==-\nby IgnoreIntuition\nLocked and stocked")
  printh(stat(93) .. ":" .. stat(94) .. ":" .. stat(95))
  printh("mem usage: " .. stat(0))
  printh("CPU: " .. stat(1))
end