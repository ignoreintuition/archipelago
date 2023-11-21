function initUnit(spr, x, y)
    local u = {}
    u.spr = spr
    u.x = x
    u.y = y
    u.sel = false
    if (u.spr == ship) then
        u.terr = land
    elseif (u.spr == troop) then
        u.terr = water
    end
    return u
end

function updateUnit(u)
    u.spr = animate(u)
end

function drawUnit(u)
    spr(u.spr, u.x * 8, u.y * 8)
    if u.sel then
        if timer % 10 ~= 0 then
            rect(u.x * 8, u.y * 8, u.x * 8 + 8, u.y * 8 + 8, 7)
        end
    end
end

function move(u, x, y)
    if (fget(u.spr, u.terr) == fget(mget(x, y), u.terr)) then
        u.x = x
        u.y = y
        return true
    end
    return false
end
