//= require_tree .

app = angular.module("app", @dependencies)

app.config ["$httpProvider", ($httpProvider) ->
  token = $("meta[name=csrf-token]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = token
]

app.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when "/users",
      controller: "UserController"
    .otherwise({ redirectTo: "/contacts" })
