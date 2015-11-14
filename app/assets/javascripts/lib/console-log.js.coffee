console.oldLog = console.log

console.log = (value) ->
  window.l = value;
  console.oldLog(value);
