module = angular.module("templateS", [])
module.factory "templateS", ["$http", "$compile", "userF", (http, compile, userF) ->

  @user = userF.currentUser

  @path = (template) => "/templates/#{template}"

  @link = (template) =>
    (scope, element, attrs) =>
      scope.$watch (=> @user.type), (newRole, formerRole) =>
        http.get("#{@path(template)}/index_#{newRole}").then (response) =>
          element.children().replaceWith compile(response.data)(scope)

  default: @default
  linker: @link
]
