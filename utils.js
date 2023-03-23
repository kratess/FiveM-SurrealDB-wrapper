function safeCallback(cb, ...args) {
  if (typeof cb === "function") return setImmediate(() => cb(...args));
  else return false;
}

module.exports = {
  safeCallback
}