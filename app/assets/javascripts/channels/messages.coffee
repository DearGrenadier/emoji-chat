App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log 'connected'

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append('<p>' + data.message + '</p>')
  send_message: (message) ->
    @perform 'send_message', message: message

$(document).ready ->
  sendMessBindEvent()

sendMessBindEvent = ->
  $('.send-mess').on 'click', (e) ->
    App.messages.send_message $('.mess-input').val()
    e.preventDefault()
