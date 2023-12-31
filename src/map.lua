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
