@routes = ["$stateProvider", "$urlRouterProvider", (stateProvider, urlRouterProvider) ->
  stateProvider
  .state 'state1',
    url: '/'
    templateUrl: 'header/index.html'
    controller: 'UserController'
  .state 'state2',
    url: '/users/:id'
    templateUrl: 'users/index.html'
]
