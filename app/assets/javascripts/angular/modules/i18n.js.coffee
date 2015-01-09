dependencies = ["i18nS"]
controller = (i18n) ->
  i18n.translations(["role", "spec"], @)

module = angular.module("i18nD", [])
module.directive "i18n", () ->
  restrict: "E"
  controller: [dependencies..., controller]
  controllerAs: "i18n"
