module = angular.module("templateS", [])
module.factory "templateS", ["$http", "$compile", "userF", (http, compile, userF) ->

  @default = (template) => "#{@path(template)}/index_visitor"

  @path = (template) => "/templates/#{template}"

  @link = (template) =>
    (scope, element, attrs) =>
      scope.$watch (=> userF.current.role), (newRole, formerRole) =>
        if newRole isnt formerRole
          http.get("#{@path(template)}/index_#{newRole}").then (response) =>
            element.children().replaceWith compile(response.data)(scope)

  default: @default
  linker: @link
]
