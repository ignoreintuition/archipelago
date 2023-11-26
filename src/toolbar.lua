function initToolbar()
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
