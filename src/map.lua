function initMap()
end

function updateMap()
  mapX = flr(c.x / 16) * 16
  mapY = flr(c.y / 15) * 15
  if timer % 30 == 0 then
    toggleTile()
  end
end

function drawMap()
  cls()
  camera(mapX * 8, (mapY - 1) * 8)
  map(0, 0, 0, 0, 128, 64)
end

function toggleTile()
  for x = mapX, mapX + 15 do
    for y = mapY, mapY + 14 do
      if isTile(2, x, y) then
        swapTile(x, y)
      elseif isTile(3, x, y) then
        unswapTile(x, y)
      end
    end
  end
end