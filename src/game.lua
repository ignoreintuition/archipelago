function _init()
    timer = 0
    animTimer = 10

    water = 0
    land = 1

    building = 1
    unit = 2

    frame1 = 2
    frame2 = 3

    ship = 19
    troop = 22
    house = 21
    farm = 24
    port = 25
    mine = 26

    sMode = 1 --select
    mMode = 2 --move
    tMode = 3 --toolbar
    dMode = 4 --dialog

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
    drawToolbar()
    drawDialog()
    drawUi()
end
