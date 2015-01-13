dependencies = ["userF"]
controller = (userF) ->
  userF.current_user().then (rUser) =>
    @user = rUser.data

  #setTimeout () =>
  #  console.log @user
  #, 2000

module = angular.module("signInD", [])
module.directive "signin", ['templateS', (templateS) ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "signInC"
  templateUrl: templateS.default('dashboard/signin')
  link: templateS.linker('dashboard/signin')
]
