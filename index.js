const Surreal = require("surrealdb.js").default;
const safeCallback = require("./utils").safeCallback;

var IS_DATABASE_CONNECTED = false;

const RPC = GetConvar("surrealdb_rpc", "http://localhost:8000/rpc");

const USER = GetConvar("surrealdb_user", "root");
const PASS = GetConvar("surrealdb_pass", "root");

const NAMESPACE = GetConvar("surrealdb_namespace", "fivem");
const DATABASE = GetConvar("surrealdb_database", "fivem");

Surreal.Instance.connect(RPC).then(() =>
  Surreal.Instance.signin({
    user: USER,
    pass: PASS,
  }).then(
    Surreal.Instance.use(NAMESPACE, DATABASE).then(
      () => (IS_DATABASE_CONNECTED = true)
    )
  )
);

// Runs a set of SurrealQL statements against the database.
function doMultiple(query, params, cb) {
  if (params === null || Array.isArray(params)) params = {};

  Surreal.Instance.query(query, params).then((result) => {
    safeCallback(cb, result);
  });
}

// Runs a query SurrealQL statement against the database.
function doQuery(query, params, cb) {
  if (params === null || Array.isArray(params)) params = {};

  Surreal.Instance.query(query, params).then((result) => {
    safeCallback(cb, result[0].result);
  });
}

// Runs a single query SurrealQL statement against the database.
function doSingle(query, params, cb) {
  if (params === null || Array.isArray(params)) params = {};

  Surreal.Instance.query(query, params).then((result) => {
    safeCallback(cb, result[0].result[0]);
  });
}

// Selects all records in a table, or a specific record, from the database.
function doSelect(thing, cb) {
  Surreal.Instance.select(thing).then((result) => {
    safeCallback(cb, result);
  }).catch((err) => safeCallback(cb, null));
}

// Selects a specific record, from the database.
function doSelectOne(thing, cb) {
  Surreal.Instance.select(thing).then((result) => {
    safeCallback(cb, result[0]);
  }).catch((err) => safeCallback(cb, null));
}

// Creates a record in the database.
function doCreate(thing, content, cb) {
  if (content === null || Array.isArray(content)) content = {};

  Surreal.Instance.create(thing, content)
    .then((result) => {
      safeCallback(cb, result);
    })
    .catch((e) => {});
}

// Updates document.
function doUpdate(thing, content, cb) {
  if (content === null || Array.isArray(content)) content = {};

  Surreal.Instance.update(thing, content).then((result) => {
    safeCallback(cb, result);
  });
}

// Merge document.
function doChange(thing, content, cb) {
  if (content === null || Array.isArray(content)) content = {};
  
  Surreal.Instance.change(thing, content).then((result) => {
    safeCallback(cb, result);
  });
}

exports("isConnected", () => IS_DATABASE_CONNECTED);
exports("multiple", doMultiple);
exports("query", doQuery);
exports("single", doSingle);
exports("select", doSelect);
exports("selectOne", doSelectOne);
exports("create", doCreate);
exports("update", doUpdate);
exports("change", doChange);
