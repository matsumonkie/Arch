module = angular.module("templateS", [])
module.factory "templateS", ["$http", "$compile", "userF", (http, compile, userF) ->

  @user = {}
  @default = "visitor"
  @user.type = @default

  userF.current_user().then (rUser) =>
    @user = rUser.data

  @default = (template) => "#{@path(template)}/index_visitor"

  @path = (template) => "/templates/#{template}"

  @link = (template) =>
    (scope, element, attrs) =>
      scope.$watch (=> @user.type), (newRole, formerRole) =>
        if newRole isnt @default
          http.get("#{@path(template)}/index_#{newRole}").then (response) =>
            element.children().replaceWith compile(response.data)(scope)

  default: @default
  linker: @link
]
