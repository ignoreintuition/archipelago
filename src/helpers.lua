function animate( t, s )
  if t == 0 then
    if fget(s, frame[1]) == true then
      return s + 1
    elseif fget(s, frame[2]) == true then
      return s - 1
    end
  end
  return s
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