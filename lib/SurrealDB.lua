SurrealDB = {}

SurrealDB.Sync = {}

---
-- Check is database is connected
---
function SurrealDB.isConnected()
  return exports.surrealdb:isConnected()
end

function SurrealDB.multiple(query, ...)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local args = {...}

  if #args > 1 then
    exports.surrealdb:multiple(query, args[1], args[2])
  else
    if type(args[1]) == "function" then
      exports.surrealdb:multiple(query, {}, args[1])
    else
      exports.surrealdb:multiple(query, args[1], {})
    end
  end
end

function SurrealDB.Sync.multiple(query, params)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local res = nil
  local finishedQuery = false

  if params then
    exports.surrealdb:multiple(query, params, function(result)
      res = result
      finishedQuery = true
    end)
  else
    exports.surrealdb:multiple(query, {}, function(result)
      res = result
      finishedQuery = true
    end)
  end

  repeat Citizen.Wait(0) until finishedQuery == true
  return res
end

function SurrealDB.query(query, ...)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local args = {...}

  if #args > 1 then
    exports.surrealdb:query(query, args[1], args[2])
  else
    if type(args[1]) == "function" then
      exports.surrealdb:query(query, {}, args[1])
    else
      exports.surrealdb:query(query, args[1], {})
    end
  end
end

function SurrealDB.Sync.query(query, params)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local res = nil
  local finishedQuery = false

  if params then
    exports.surrealdb:query(query, params, function(result)
      res = result
      finishedQuery = true
    end)
  else
    exports.surrealdb:query(query, {}, function(result)
      res = result
      finishedQuery = true
    end)
  end

  repeat Citizen.Wait(0) until finishedQuery == true
  return res
end

function SurrealDB.single(query, ...)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local args = {...}

  if #args > 1 then
    exports.surrealdb:single(query, args[1], args[2])
  else
    if type(args[1]) == "function" then
      exports.surrealdb:single(query, {}, args[1])
    else
      exports.surrealdb:single(query, args[1], {})
    end
  end
end

function SurrealDB.Sync.single(query, params)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local res = nil
  local finishedQuery = false

  if params then
    exports.surrealdb:single(query, params, function(result)
      res = result
      finishedQuery = true
    end)
  else
    exports.surrealdb:single(query, {}, function(result)
      res = result
      finishedQuery = true
    end)
  end

  repeat Citizen.Wait(0) until finishedQuery == true
  return res
end

function SurrealDB.select(thing, cb)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  exports.surrealdb:select(thing, cb)
end

function SurrealDB.Sync.select(thing)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local res = nil
  local finishedQuery = false

  exports.surrealdb:select(thing, function(result)
    res = result
    finishedQuery = true
  end)

  repeat Citizen.Wait(0) until finishedQuery == true
  return res
end

function SurrealDB.selectOne(thing, cb)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  exports.surrealdb:selectOne(thing, cb)
end

function SurrealDB.create(thing, content, cb)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  exports.surrealdb:create(thing, content, cb)
end

function SurrealDB.update(thing, content, cb)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  exports.surrealdb:update(thing, content, cb)
end

function SurrealDB.merge(thing, content, cb)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  exports.surrealdb:change(thing, content, cb)
end

function SurrealDB.Sync.merge(thing, content)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local res = nil
  local finishedQuery = false

  exports.surrealdb:change(thing, content, function(result)
    res = result
    finishedQuery = true
  end)

  repeat Citizen.Wait(0) until finishedQuery == true
  return res
end