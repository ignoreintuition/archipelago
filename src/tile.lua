function getTileInfo(x, y)
  local t = {}
  t.tile = mget(x, y)
  t.terr = ""
  if fget(t.tile, 0) and fget(t.tile, 1) then
    t.terr = "beach"
  elseif fget(t.tile, 0) then
    t.terr = "water"
  elseif t.tile == 16 then
    t.terr = "stone"
  elseif t.tile == 17 then
    t.terr = "forest"
  elseif fget(t.tile, 1) then
    t.terr = "land"
  end
  return t
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