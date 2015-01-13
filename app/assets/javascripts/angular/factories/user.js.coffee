module = angular.module("userF", [])
module.factory "userF", ["$http", (http) ->

  @current_user = {}

  foo = () =>
    http.get('/users/current')

  current_user: foo

]
