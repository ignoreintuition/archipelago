function initTitle()
  titleBoat = 19
end

function drawTitle()
  cls()
  print( "archipelago", 30, 20, 7)
  print( "by ignoreintuition", 18, 28, 7)
  spr(titleBoat, 45, 40)
  print( "press 🅾️ to start", 20, 54, 7 )
end

function updateTitle()
    if btnp(🅾️) then
    state = gameState["game"]
  end
end