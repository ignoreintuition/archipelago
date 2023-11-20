function _init()
  timer=0
  animTimer=10

  water=0
  land=1
  beach=2
  frame1=2
  frame2=3
  unit=4

  initMap()
  initSprites()
  initUi()
  printh("Locked and stocked.")
end

function _update()
  if (timer<0) then
    timer=animTimer
  end
  timer-=1
  updateMap()
  updateSprites()
  updateUi()
end

function _draw()
  drawMap()
  drawSprites()
  drawUi()
end