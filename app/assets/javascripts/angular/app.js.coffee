//= require_tree .

app = angular.module("app", @dependencies)

app.config ["$httpProvider", ($httpProvider) ->
  token = $("meta[name=csrf-token]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = token
]

app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: "/assets/header/index.html"
      controller: "RootController"
    .when '/users/:id',
      template: "index.html"
      controller: "UserController"

myApp = angular.module("UserController", [])
myApp.controller "UserController", ($routeParams) ->


myApp = angular.module("RootController", [])
myApp.controller "RootController", ($scope) ->
