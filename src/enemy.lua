function initEnemy()
  enemyX = 8
  enemyY = 8
  direction = -1
end

function updateEnemy()
  if timer % 120 == 0 then
    if enemyX % 10 == 0 then
      direction = direction * -1
    end
    enemyX = enemyX + direction
  end
end

function drawEnemy()
  spr(27, enemyX * 8, enemyY * 8)
end