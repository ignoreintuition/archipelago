function initGoals()
  displayGoal = true
  goalSuccess = false
end

function updateGoals()
  if displayGoal then
    if btnp(❎) or btnp(🅾️) then
      displayGoal = false
    end
  end
  if resource.gold >= 100 then
    goalSuccess = true
  end
end

function drawGoals()
  if displayGoal then
    dialog(
      "welcome",
      { "the queen would\nlike to welcome\nyou to archipelago\n\nyour goal: \nearn 100 gold" },
      "lg",
      64
    )
    mode = modes["dialog"]
  elseif goalSuccess then
    dialog(
      "congratulations",
      { "the queen is\nsatisfied\n" },
      "lg",
      64
    )
    mode = modes["dialog"]
  end
end