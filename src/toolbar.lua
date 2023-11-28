function initToolbar()
    activeAction = 0
    toolbarActive = false
end

function setToolbarActive(val)
    toolbarActive = val
end

function drawToolbar()
    if toolbarActive then
        local x = mapX * 8 + 40
        local y = mapY * 8 + 64
        rectfill(x, y, x + 40, y + 8, 0)
        spr(48, x, y)
        spr(49, x + 8, y)
        spr(50, x + 16, y)
        spr(51, x + 24, y)
        spr(52, x + 32, y)
    end
end

function showToolbar()
    tbx = 40 + 8 * activeAction
    tby = 64
    rect(tbx, tby, tbx + 8, tby + 8, 5)
    if btnp(0) then
        activeAction = (activeAction - 1) % 5
    elseif btnp(1) then
        activeAction = (activeAction + 1) % 5
    elseif btnp(4) then
        addBuilding()
    elseif btnp(5) then
        setToolbarActive(false)
        mode = sMode
    end
end

function addBuilding()
    if (activeAction == 0) then
        addSprite({house, c.x, c.y})
    elseif (activeAction == 1) then
        addSprite({farm, c.x, c.y})
    elseif (activeAction == 2) then
        addSprite({mine, c.x, c.y})
    elseif (activeAction == 3) then
        printh('boom')
    elseif (activeAction == 4) then
    end
    setToolbarActive(false)
    activeAction = 0
    mode = sMode
end
