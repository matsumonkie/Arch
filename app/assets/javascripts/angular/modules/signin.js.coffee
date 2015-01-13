dependencies = ["userF"]
controller = (userF) ->
  userF.current_user().then (rUser) =>
    @user = rUser.data

module = angular.module("signInD", [])
module.directive "signin", ['templateS', (templateS) ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "signInC"
  templateUrl: templateS.default('dashboard/signin')
  link: templateS.linker('dashboard/signin')
]
