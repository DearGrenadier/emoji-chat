window.app.controller('ChatsCtrl', ['$scope', 'Sessions', 'Messages', ($scope, Sessions, Messages) ->
  $scope.user = Sessions.getSession()
  $scope.messages = []
  $scope.message = {}

  $scope.sendMessage = ->
    $scope.message.author = $scope.user.username
    App.room.sendMessage($scope.message)
    $scope.message.content = ""

  $scope.initMessages = ->
    Messages.getList().then (data) ->
      debugger
      $scope.messages = data

  $scope.initMessages()
  Messages.initChannel($scope)
])
