window.app.factory('Messages', (Restangular) ->
  messages =

    initChannel: (scope) ->
      App.room = App.cable.subscriptions.create 'MessagesChannel',
        connected: ->

        disconnected: ->

        received: (data) ->
          scope.messages.push(data.message)
          scope.$apply()

        sendMessage: (message) ->
          @perform 'send_message', message: message

    getList: ->
      Restangular.all('messages').getList()
)
