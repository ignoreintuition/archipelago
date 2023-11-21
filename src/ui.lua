function initUi()
    mode = 1
    c = {}
    c.x = 0
    c.y = 0
    c.w = 8
    c.h = 8
end

function updateUi()
    newX = c.x
    newY = c.y
    if (btnp(0)) then
        newX = newX - 1
    end
    if (btnp(1)) then
        newX = newX + 1
    end
    if (btnp(2)) then
        newY = newY - 1
    end
    if (btnp(3)) then
        newY = newY + 1
    end
    c.x = mid(0, newX, 127)
    c.y = mid(0, newY, 63)
end

function drawUi()
    rect(c.x * 8, c.y * 8, c.x * 8 + c.w, c.y * 8 + c.h, 5)
    if (btn(4)) then
        local spr = getSpriteInfo(c.x, c.y)
        if (spr) then
            -- TODO convert dialog to array
            dialog("Info", spr.terr, "lg")
        else
            local tile = getTileInfo(c.x, c.y)
            dialog("Info", tile, "lg")
        end
    end
    if (btnp(5)) then
        check(c.x, c.y)
    end
end

function dialog(t, c, sz)
    local size = {}
    size.lg = {20, 8, 88, 96}
    size.sm = {40, 16, 44, 48}
    local x = mapX * 8 + size[sz][1]
    local y = mapY * 8 + size[sz][2]
    rectfill(x, y, x + size[sz][3], y + 8, 7)
    rectfill(x, y + 8, x + size[sz][3], y + size[sz][4] - 8, 0)
    print(t, x + 2, y + 2, 0)
    print(c, x + 2, y + 10, 7)
end

function check(x, y)
    if mode == 1 then
        if selectSprite(x, y) then
            mode = 2
        end
    elseif mode == 2 then
        if moveSprite(x, y) then
            mode = 1
        else
            sfx(0)
        end
    end
end
