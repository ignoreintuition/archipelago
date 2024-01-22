gMap = {
  zones = {},
  x = 0,
  y = 0,
  width = 128,
  height = 64,
  _init = function(self)
    local zCount = 1
    for j = 0, self.width, 1 do
      for i = 0, self.height, 1 do
        if isWalkable(i, j) then
          if isWalkable(i - 1, j) then
            local z = checkZone(i - 1, j)
            add(
              self.zones,
              { x = i, y = j, zone = z }
            )
          elseif isWalkable(i, j - 1) then
            local z = checkZone(i, j - 1)
            add(
              self.zones,
              { x = i, y = j, zone = z }
            )
          else
            add(
              self.zones,
              { x = i, y = j, zone = zCount }
            )
            zCount += 1
          end
        end
      end
    end
  end,
  _update = function(self)
    self.x = flr(c.x / 16) * 16
    self.y = flr(c.y / 15) * 15
    if timer % 30 == 0 then
      toggleTile()
    end
  end,
  _draw = function(self)
    cls()
    camera(self.x * 8, (self.y - 1) * 8)
    map(0, 0, 0, 0, 128, 64)
  end
}
function initMap()
  gMap._init(gMap)
end

function updateMap()
  gMap._update(gMap)
end

function drawMap()
  gMap._draw(gMap)
end

function checkZone(x, y)
  if gMap.zones then
    for i, v in ipairs(gMap.zones) do
      if v.x == x and v.y == y then
        return v.zone
      end
    end
    return 0
  else
    return nil
  end
end

function isWalkable(x, y)
  return mget(x, y) >= 3 and mget(x, y) <= 18
end