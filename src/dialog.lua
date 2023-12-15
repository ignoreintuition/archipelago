dSize = {}
dSize.lg = { 20, 8, 88, 96 }
dSize.sm = { 40, 16, 44, 48 }
d = {}
dialogActive = false
function dialog(t, c, sz)
  d.c = c
  d.t = t
  d.sz = sz
  d.x = mapX * 8 + dSize[sz][1]
  d.y = mapY * 8 + dSize[sz][2]
  dialogActive = true
end

function drawDialog()
  if dialogActive == true then
    rectfill(d.x, d.y, d.x + dSize[d.sz][3], d.y + 8, 7)
    rectfill(d.x, d.y + 8, d.x + dSize[d.sz][3], d.y + dSize[d.sz][4] - 8, 0)
    print(d.t, d.x + 2, d.y + 2, 0)
    for i, v in ipairs(d.c) do
      print(v, d.x + 2, d.y + 10 + 8 * (i - 1), 7)
    end
  end
end

function resetDialog()
  d = {}
  dialogActive = false
end