function initEnemy()
  enemyX = 10
  enemyY = 10
end

function updateEnemy()
if (timer % 60 == 0) then
    enemyX = enemyX - 1
  end
end

function drawEnemy()
  spr(27, enemyX*8, enemyY*8)
end
