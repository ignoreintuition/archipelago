function initMap()
  
end

function updateMap()

end

function drawMap()
    cls()
    mapX = flr(c.x / 16) * 16
    mapY = flr(c.y / 16) * 16
    camera(mapX * 8, mapY * 8)

    map(0, 0, 0, 0, 128, 64)
end
