function initTitle()
  title = {
  boat = 19,
  timer = 0,
  animTimer = 10
  }
end

function drawTitle()
  cls()
  map(0, 0, 0, 0, 128, 64)
  rectfill(18, 24, 110, 64, 7) 
  rectfill(20, 26, 108, 62,  0) 
  print( "archipelago", 40, 28, 7)
  print( "a game by brian greig", 22, 42, 7)
  print( "press 🅾️ to start", 30, 56, 7 )
  spr(title.boat, 60, 68)
  
end

function updateTitle()
    if btnp(🅾️) then
    state = gameState["game"]
  end
  updateTimer()
  title.boat = animate(title.timer, title.boat)
end

function updateTimer()
  if state == gameState["title"] then
  if (title.timer <= 0) then
  title.timer = title.animTimer 
  end
    title.timer = title.timer - 1
  end
end