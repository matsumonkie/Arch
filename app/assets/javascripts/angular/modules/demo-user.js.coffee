dependencies = ["userF"]
controller = (userF) ->

  @currentUser = userF.currentUser

  @changeRole = (role) =>
    userF.changeRole(role)

module = angular.module("demoUserD", [])
module.directive "demoUser", () ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "demoUserC"
