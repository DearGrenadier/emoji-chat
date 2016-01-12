window.app.controller('ChatsCtrl', ['$scope', 'Sessions', 'Messages', 'Emoji', ($scope, Sessions, Messages, Emoji) ->
  $scope.user = Sessions.getSession()
  Messages.initChannel($scope)
  $scope.messages = []
  $scope.message = {}

  $scope.sendMessage = ->
    $scope.message.author = $scope.user.username
    App.room.sendMessage($scope.message)
    $scope.message.content = ""

  $scope.initMessages = ->
    Messages.getList().then (data) ->
      $scope.messages = data

  $scope.initEmoji = ->
    Emoji.getList().then (data) ->
      $scope.emojies = data

  $scope.initMessages()
  $scope.initEmoji()
])
