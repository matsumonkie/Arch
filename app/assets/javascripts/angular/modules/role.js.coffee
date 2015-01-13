dependencies = ["$scope", "$rootScope", "userF", "i18nS"]
controller = (scope, rootScope, userF, i18n) ->
  @user = userF.current

  @changeRole = (role) =>
    @user.role = role

module = angular.module("roleD", [])
module.directive "role", ['templateS', (templateS) ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "roleC"
  templateUrl: templateS.default('dashboard')
  link: templateS.linker('dashboard')
]
