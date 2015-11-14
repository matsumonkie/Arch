//= require_tree .

app = angular.module("app", @dependencies.concat(@regular_dependencies))
app.config @config
app.config @routes
app.run @runtimeConfig
