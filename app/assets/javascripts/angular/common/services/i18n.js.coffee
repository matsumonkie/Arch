module = angular.module("i18nS", [])
module.service "i18nS", ["$http", (http) ->

  @translations = {}

  @init = (modules) =>
    http
      method: 'get'
      url: "/api/translations/"
      params:
        'id[]': modules
    .success (response) =>
      _.merge(@translations, response)

  init: @init
  translations: @translations
]
