module = angular.module("templateS", [])
module.factory "templateS", ["$http", "$compile", "userF", (http, compile, userF) ->

  @user = userF.currentUser

  @path = (template, role) => "/templates/#{template}/index_#{role}"

  @link = (template) =>
    (scope, element, attrs) =>
      scope.$watch (=> @user.type), (newRole, formerRole) =>
        path = @path(template, newRole)
        http.get(path).then (response) =>
          element.html(response.data)
          compile(element.contents())(scope)

  linker: @link
]
