module = angular.module("userF", [])
module.factory "userF", ["$http", ($http) ->

  @user =
    firstname: "iori"
    lastname: "tsu"
    role: "visitor"

  current: @user

]
