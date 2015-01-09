module = angular.module("localForageS", [])
module.service "localforage", ["$localForage", ($localForage) ->

  defaultExpirationTime = () ->
    oneHour = 1000 * 60 * 60
    now() + oneHour

  store = (key, value, expireAt) ->
    expireAt = defaultExpirationTime() unless expireAt?

    value = _.merge(value, expireAt: expireAt)
    $localForage.setItem key, value

  now = ->
    new Date().getTime()

  keys = ->
    $localForage.keys()

  get = (key) ->
    $localForage.getItem key

  clear = ->
    $localForage.clear()

  expired = (object) ->
    now() > object.expireAt

  removeItem = (key) ->
    $localForage.removeItem key

  return (
    get: get
    expired: expired
    store: store
    removeItem: removeItem
    keys: keys
    clear: clear
  )
]
