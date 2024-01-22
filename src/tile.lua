function getTileInfo(x, y)
  local t = {}
  t.tile = mget(x, y)
  t.terr = ""
  if fget(t.tile, beach) then
    t.terr = "beach"
  elseif fget(t.tile, water) then
    t.terr = "water"
  elseif fget(t.tile, mountain) then
    t.terr = "mountain"
  elseif fget(t.tile, forest) then
    t.terr = "forest"
  elseif fget(t.tile, land) then
    t.terr = "land"
  end
  return t
end

function toggleTile()
  for x = gMap.x, gMap.x + 15 do
    for y = gMap.y, gMap.y + 14 do
      if isTile(2, x, y) then
        swapTile(x, y)
      elseif isTile(3, x, y) then
        unswapTile(x, y)
      end
    end
  end
end