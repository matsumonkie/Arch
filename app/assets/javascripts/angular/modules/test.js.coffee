dependencies = ["$scope", "$rootScope", "userF", "$http", "$compile"]
controller = (scope, rootScope, userF, http, compile) ->
  @user = userF.current

  @changeRole = (role) =>
    @user.role = role

module = angular.module("testD", [])
module.directive "test", ['$http', '$compile', 'templateS', (http, compile, templateS) ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "testC"
  templateUrl: templateS.default('test')
  link: templateS.linker('test')
]
