dependencies = ["userF"]
controller = (userF) ->

  userF.currentUser

  @changeRole = (role) =>
    @user.type = role

module = angular.module("roleD", [])
module.directive "role", ['templateS', (templateS) ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "roleC"
  link: templateS.linker('dashboard')
]
