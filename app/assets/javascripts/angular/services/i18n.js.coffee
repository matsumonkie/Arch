module = angular.module("i18nS", [])
module.service "i18nS", ["$http", "localforage", (http, localforage) ->

  translations = (modules, that) =>
    that.i18n = {} unless that.i18n?

    localforage.get("i18n").then (i18n) =>
      i18n = {} unless i18n?
      handle(i18n, module, that) for module in modules

  handle = (i18n, module, that) =>
    if i18n[module]?
      if localforage.expired?(i18n)
        get(module).then (response) => merge_and_store(response.data, module, i18n, that)
      else
        that.i18n[module] = i18n[module]
    else
      i18n[module] = {}
      get(module).then (response) => merge_and_store(response.data, module, i18n, that)

  merge_and_store = (translation, module, i18n, that) =>
    _.merge(i18n[module], translation)
    store(i18n)
    that.i18n[module] = i18n[module]

  get = (module) =>
    http.get "/translations/#{module}"

  store = (i18n) =>
    localforage.store('i18n', i18n)

  translations: translations
]
