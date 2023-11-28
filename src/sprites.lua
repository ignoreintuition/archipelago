sprites = {}

function initSprites()
    for i, v in ipairs({{ship, 1, 1}, {ship, 10, 10}, {ship, 18, 3}, {troop, 5, 2}, {troop, 6, 2}, {house, 4, 3}}) do
        addSprite(v)
    end
end

function updateSprites()
    for i, v in ipairs(sprites) do
        if v.type == unit then
            updateUnit(v)
        end
    end
end

function drawSprites()
    for i, v in ipairs(sprites) do
        if v.type == unit then
            drawUnit(v)
        else
            drawBuilding(v)
        end
    end
end

function selectSprite(x, y)
    for i, v in ipairs(sprites) do
        if v.type == unit then
            if v.x == x and v.y == y then
                return selectUnit(v)
            end
        elseif v.type == building then
            if v.x == x and v.y == y then
                return selectBuilding(v)
            end
        end
    end
    return
end

function getSpriteInfo(x, y)
    for i, v in ipairs(sprites) do
        if v.type == unit or v.type == building then
            if v.x == x and v.y == y then
                return v
            end
        end
    end
    return false
end

function moveSprite(x, y)
    for i, v in ipairs(sprites) do
        if v.sel and v.type == unit then
            local res = moveUnit(v, x, y)
            v.sel = not res
            return res
        end
    end
end

function addSprite(v)
    if v[1] == ship or v[1] == troop then
        add(sprites, initUnit(v[1], v[2], v[3]))
    else
        add(sprites, initBuilding(v[1], v[2], v[3]))
    end
end
