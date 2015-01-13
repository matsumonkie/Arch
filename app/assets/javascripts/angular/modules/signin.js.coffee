dependencies = ["userF"]
controller = (userF) ->

  @currentUser = userF.currentUser

  @signOut = () =>
    userF.signOut()

module = angular.module("signInD", [])
module.directive "signin", ['templateS', (templateS) ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "signInC"
  templateUrl: templateS.default('dashboard/signin')
  link: templateS.linker('dashboard/signin')
]
