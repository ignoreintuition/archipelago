function _init()
  timer = 0
  animTimer = 10

  water = 0
  land = 1

  building = 1
  unit = 2

  frame1 = 2
  frame2 = 3

  sprites = {
    ship = 19,
    troop = 22,
    house = 21,
    farm = 24,
    port = 25,
    mine = 26,
    barracks = 29,
    port = 30
  }
  spriteDesc = {
    ship = "travels by sea. \ncan carry cargo \nor passengers.",
    troop = "travels by land. \nrequires 1 food.",
    house = "houses families.",
    farm = "provides food. \nrequires farmers.",
    port = "build Ships. \nload / unload goods.",
    mine = "harvest ore",
    barracks = "train peasants to fight."
  }
  sMode = 1
  --select
  mMode = 2
  --move
  tMode = 3
  --toolbar
  dMode = 4
  --dialog

  wood = 0
  food = 0
  ore = 0
  gold = 0
  day = 1

  initMap()
  initSprites({
    { "ship", 1, 1 },
    { "ship", 10, 10 },
    { "ship", 18, 3 },
    { "troop", 5, 2 },
    { "troop", 6, 2 }
  })
  initEnemy()
  initUi()
  initToolbar()
  printh("\n\n-==ARCHIPELAGO==-\nby IgnoreIntuition\nLocked and stocked")
  printh(stat(93) .. ":" .. stat(94) .. ":" .. stat(95))
  printh("mem usage: " .. stat(0))
  printh("CPU: " .. stat(1))
end

function _update()
  if (timer < 0) timer = animTimer
  timer = timer - 1
  updateMap()
  updateSprites()
  updateEnemy()
  updateUi()
end

function _draw()
  drawMap()
  drawSprites()
  drawEnemy()
  drawToolbar()
  drawDialog()
  drawUi()
end