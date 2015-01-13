module = angular.module("userF", [])
module.factory "userF", ["$http", (http) ->

  current_user = () => http.get('/users/current')

  current_user: current_user

]
