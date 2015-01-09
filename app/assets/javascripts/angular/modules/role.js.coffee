dependencies = ["$scope", "$rootScope", "userF", "$http", "$compile", "i18nS"]
controller = (scope, rootScope, userF, http, compile, i18n) ->
  @user = userF.current

  @changeRole = (role) =>
    @user.role = role

module = angular.module("roleD", [])
module.directive "role", ['$http', '$compile', 'templateS', (http, compile, templateS) ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "roleC"
  templateUrl: templateS.default('dashboard')
  link: templateS.linker('dashboard')
]
