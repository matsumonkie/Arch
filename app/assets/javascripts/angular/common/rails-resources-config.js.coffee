module = angular.module("railsR", [])
module.factory 'RailsR', ['RailsResource', (RailsResource) ->
  class RailsR extends RailsResource
    rootWrapping: false

    @rootUrl = "/api"
    @adminRootUrl = "#{@rootUrl}/admin"
]
