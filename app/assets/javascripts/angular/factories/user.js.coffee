module = angular.module("userF", [])
module.factory "userF", ["$http", (http) ->

  @currentUser = {
    type: "visitor"
  }

  initCurrentUser = () =>
    http.get('/users/current').then (rUser) =>
      _.merge(@currentUser, rUser.data)
  initCurrentUser()

  signOut = () =>
    http.delete('/users/sign_out')

  currentUser: @currentUser
  signOut: signOut

]
