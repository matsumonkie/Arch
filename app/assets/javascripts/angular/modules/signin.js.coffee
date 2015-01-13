dependencies = ["userF"]
controller = (userF) ->

  @currentUser = userF.currentUser

  @signOut = () =>
    userF.signOut()

  @signIn = (email, password) =>
    userF.signIn(email, password)

module = angular.module("signInD", [])
module.directive "signin", ['templateS', (templateS) ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "signInC"
  templateUrl: templateS.default('dashboard/signin')
  link: templateS.linker('dashboard/signin')
]
