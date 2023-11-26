function _init()
    timer = 0
    animTimer = 10

    water = 0
    land = 1
    frame1 = 2
    frame2 = 3

    ship = 19
    troop = 22

    initMap()
    initSprites()
    initUi()
    initToolbar()
    printh("Locked and stocked.")
end

function _update()
    if (timer < 0) timer = animTimer
    timer = timer - 1
    updateMap()
    updateSprites()
    updateUi()
end

function _draw()
    drawMap()
    drawSprites()
    drawUi()
    drawToolbar()
end
