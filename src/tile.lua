function getTileInfo(x, y)
    local t = {}
    t.tile = mget(x, y)
    t.terr = ""
    if (fget(t.tile, 0) and fget(t.tile,1)) then
      t.terr = "beach"
    elseif fget(t.tile,0) then
      t.terr = "water"
    elseif (t.tile == 16) then
      t.terr = "stone"
    elseif (t.tile == 17) then
      t.terr = "forest"
    elseif (fget(t.tile,1)) then
      t.terr = "land"
    end
    return t
end
