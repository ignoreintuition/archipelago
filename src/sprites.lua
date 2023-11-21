units = {}

function initSprites()
    for i, v in ipairs({{ship, 1, 1}, {ship, 10, 10}, {ship, 18, 3}, {troop, 5, 2}, {troop, 6, 2}}) do
        units[i] = initUnit(v[1], v[2], v[3])
    end
end

function updateSprites()
    for i, v in ipairs(units) do
        updateUnit(v)
    end
end

function drawSprites()
    for i, v in ipairs(units) do
        drawUnit(v)
    end
end

function selectSprite(x, y)
    for i, v in ipairs(units) do
        if v.x == x and v.y == y then
            v.sel = true
            return v.sel
        end
    end
    return
end

function getSpriteInfo(x, y)
    for i, v in ipairs(units) do
        if v.x == x and v.y == y then
          return v
        end
    end
    return false
end

function moveSprite(x, y)
    for i, v in ipairs(units) do
        if v.sel then
            local res = move(v, x, y)
            v.sel = not res 
            return res
        end
    end
end
