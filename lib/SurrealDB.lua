SurrealDB = {}

---
-- Check is database is connected
---
function SurrealDB.isConnected()
  return exports.surrealdb:isConnected()
end

function SurrealDB.multiple(query, ...)
  local args = {...}

  if #args > 1 then
    exports.surrealdb:multiple(query, args[1], args[2])
  else
    exports.surrealdb:multiple(query, {}, args[1])
  end
end

function SurrealDB.query(query, ...)
  local args = {...}

  if #args > 1 then
    exports.surrealdb:query(query, args[1], args[2])
  else
    exports.surrealdb:query(query, {}, args[1])
  end
end

function SurrealDB.single(query, ...)
  local args = {...}

  if #args > 1 then
    exports.surrealdb:single(query, args[1], args[2])
  else
    exports.surrealdb:single(query, {}, args[1])
  end
end

function SurrealDB.single(query, ...)
  local args = {...}

  if #args > 1 then
    exports.surrealdb:single(query, args[1], args[2])
  else
    exports.surrealdb:single(query, {}, args[1])
  end
end

function SurrealDB.select(thing, cb)
  exports.surrealdb:select(thing, cb)
end

function SurrealDB.selectOne(thing, cb)
  exports.surrealdb:selectOne(thing, cb)
end

function SurrealDB.create(thing, content, cb)
  exports.surrealdb:create(thing, content, cb)
end

function SurrealDB.update(thing, content, cb)
  exports.surrealdb:update(thing, content, cb)
end

function SurrealDB.change(thing, content, cb)
  exports.surrealdb:change(thing, content, cb)
end