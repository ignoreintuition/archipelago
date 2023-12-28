function initTimers()
  timers = {
    animation = {},
    day = {
      curr = 0,
      max = 240
    }
  }
  timer = 0
  animTimer = 10
end

function updateTimers()
  if (timer < 0) timer = animTimer
  timer = timer - 1
  if timers["day"]["curr"] < 0 then
    timers["day"]["curr"] = timers["day"]["max"]
    day = day + 1
  end
  timers["day"]["curr"] = timers["day"]["curr"] - 1
end