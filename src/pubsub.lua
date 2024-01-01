function initBroker() 
  messageQueue = {}
  subscribers = {}
end

function updateBroker()
end

function addMessageToQueue(msg)
  add(messageQueue, msg)
end

function subscribeToMessage(sub, msg, cb)

  add(subscribers, {sub, msg, cb})
end

function alertSubscribers(msg)
  for i, v in ipairs(subscribers) do
    if v[2] == msg then
      v[3]()
    end
  end
end