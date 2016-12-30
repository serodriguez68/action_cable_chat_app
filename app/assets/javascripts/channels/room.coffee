App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.message?
      $('#messages-table').append data.message
      scroll_bottom()


# Tutorial version
$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      console.log 'Hit enter'
      $('input').click()
      event.target.value = ""
      event.preventDefault()


# SR Version
# submit_message =  (event) ->
#   if event.keyCode is 13
#     console.log 'Hit enter SR version'
#     $('input[type=submit]').click()
#     event.target.value = ''
#     event.preventDefault()

# $(document).on 'turbolinks:load', ->
#   $('#message_content').on 'keydown', submit_message


scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
