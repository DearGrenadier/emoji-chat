window.app.controller('SessionsCtrl', ['$scope', '$state', 'Sessions', ($scope, $state, Sessions) ->
    $scope.session = {}

    $scope.createSession = ->
      Sessions.post($scope.session).then ->
        $state.go('chat')
])
