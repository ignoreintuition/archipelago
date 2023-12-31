function animate(s)
  if timer == 0 then
    if fget(s.spr, frame[1]) == true then
      return s.spr + 1
    elseif fget(s.spr, frame[2]) == true then
      return s.spr - 1
    end
  end
  return s.spr
end

function isTile(type, x, y)
  tile = mget(x, y)
  return fget(tile, type)
end

function swapTile(x, y)
  tile = mget(x, y)
  mset(x, y, tile + 1)
end

function unswapTile(x, y)
  tile = mget(x, y)
  mset(x, y, tile - 1)
end