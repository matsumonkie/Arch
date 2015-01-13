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
    .error (res) =>_.merge(@currentUser, res);
    .success (res) => _.merge(@currentUser, res);

  signIn = (email, password) =>
    http.post('/users/sign_in',
      email: email
      password: password
    ).error (res) => _.merge(@currentUser, res)
      .success (res) => _.merge(@currentUser, res)

  currentUser: @currentUser
  signOut: signOut
  signIn: signIn

]
