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
  addMessageToQueue("day")
end

function updateTimers()
  if (timer <= 0) timer = animTimer
  if mode != modes["dialog"] and mode != modes["toolbar"] then
    timer = timer - 1
    if timers["day"]["curr"] < 0 then
      timers["day"]["curr"] = timers["day"]["max"]
      day = day + 1
      alertSubscribers("day")
    end
    timers["day"]["curr"] = timers["day"]["curr"] - 1
  end
end