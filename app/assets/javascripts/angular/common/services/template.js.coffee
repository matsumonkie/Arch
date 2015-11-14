dependencies = ["$templateCache", "$compile", "CurrentUser"]
factory = (templateCache, compile, CurrentUser) ->

  @user = CurrentUser.self

  @path = (template, role) =>
    _.compact(["#{template}/view", role]).join("_") + ".html"

  @getTemplate = (template, newRole) =>
    role_template = templateCache.get(@path(template, newRole))
    common_template = templateCache.get(@path(template, null))
    default_template = ""
    role_template || common_template || default_template

  @link = (template) =>
    (scope, element, attrs) =>
      scope.$watch (=> @user.type), (newRole, formerRole) =>
        html = @getTemplate(template, newRole)
        element.html(html)
        compile(element.contents())(scope)

  linker: @link

module = angular.module("templateS", [])
module.factory "templateS", [dependencies..., factory]
