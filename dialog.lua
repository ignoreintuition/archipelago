function dialog(t, c, sz)
  local size = {}
  size.lg = { 20, 8, 88, 96 }
  size.sm = { 40, 16, 44, 48 }
  local x = mapX * 8 + size[sz][1]
  local y = mapY * 8 + size[sz][2]
  rectfill(x, y, x + size[sz][3], y + 8, 7)
  rectfill(x, y + 8, x + size[sz][3], y + size[sz][4] - 8, 0)
  print(t, x + 2, y + 2, 0)
  for i, l in pairs(c) do
    print(l, x + 2, y + 10 * i, 7)
  end
end