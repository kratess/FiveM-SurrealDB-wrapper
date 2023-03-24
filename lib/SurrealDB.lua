SurrealDB = {}

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
    exports.surrealdb:multiple(query, {}, args[1])
  end
end

function SurrealDB.query(query, ...)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local args = {...}

  if #args > 1 then
    exports.surrealdb:query(query, args[1], args[2])
  else
    exports.surrealdb:query(query, {}, args[1])
  end
end

function SurrealDB.single(query, ...)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local args = {...}

  if #args > 1 then
    exports.surrealdb:single(query, args[1], args[2])
  else
    exports.surrealdb:single(query, {}, args[1])
  end
end

function SurrealDB.single(query, ...)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  local args = {...}

  if #args > 1 then
    exports.surrealdb:single(query, args[1], args[2])
  else
    exports.surrealdb:single(query, {}, args[1])
  end
end

function SurrealDB.select(thing, cb)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  exports.surrealdb:select(thing, cb)
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

function SurrealDB.change(thing, content, cb)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  exports.surrealdb:change(thing, content, cb)
end

function SurrealDB.merge(thing, content, cb)
  if not SurrealDB.isConnected() then repeat Citizen.Wait(0) until SurrealDB.isConnected() end

  exports.surrealdb:change(thing, content, cb)
end