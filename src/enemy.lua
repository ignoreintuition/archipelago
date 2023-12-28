function initEnemy()
  enemy = {
    x = 8,
    y = 8,
    dir = -1
  }
end

function updateEnemy()
  if timer % 120 == 0 then
    if enemy["x"] % 10 == 0 then
      enemy["dir"] = enemy["dir"] * -1
    end
    enemy["x"] = enemy["x"] + enemy["dir"]
  end
end

function drawEnemy()
  spr(27, enemy["x"] * 8, enemy["y"] * 8)
end