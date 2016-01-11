window.app
.config(['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state('home', {
    url: '/home'
    templateUrl: '../assets/sessionsCreate.html'
    controller: 'SessionsCtrl'
  })
  .state('chat', {
    url: '/chat'
    templateUrl: '../assets/chatsIndex.html'
    controller: 'ChatsCtrl'
  })
  $urlRouterProvider.otherwise('home')
])
