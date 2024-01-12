dSize = {
  lg = { 20, 8, 88, 96 },
  sm = { 40, 16, 44, 48 }
}
d = {
  active = false,
  resolved = false
}
events = {
  closeWindow = false
}

function dialog(t, c, sz, spr)
  d = {
    active = true,
    resolved = false,
    c = c,
    t = t,
    sz = sz,
    x = mapX * 8 + dSize[sz][1],
    y = mapY * 8 + dSize[sz][2],
  } 
  if spr then
    d.imageDialog = true
    d.spr = spr
  end
  mode = modes["dialog"]
end

function drawDialog()
  offset = 0
  if d["imageDialog"] then 
    offset = 10
  end
  if d["active"] == true then
    rectfill(d.x, d.y, d.x + dSize[d.sz][3], d.y + 8, 7)
    rectfill(d.x, d.y + 8, d.x + dSize[d.sz][3], d.y + dSize[d.sz][4] - 8, 0)
    print(d.t, d.x + 2, d.y + 2, 0)
    if d["imageDialog"] then
      spr(d["spr"], d.x + 2, d.y + 10)
    end
    for i, v in ipairs(d.c) do
      print(v, d.x + 2 + offset, d.y + 10 + 8 * (i - 1), 7)
    end
    print("\n❎ok\n🅾️cancel", d.x + 2, d.y + dSize[d.sz][4] - 26)
  end
end

function resetDialog()
  d["active"] = false
  mode = prevMode
end