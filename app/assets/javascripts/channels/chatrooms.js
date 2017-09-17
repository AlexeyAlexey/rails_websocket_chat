$(document).on('turbolinks:load', function() {
  room = $("form#new_message input[id='message_chatroom_id']");
  if (room.length > 0) {
    connectChatroom(room.val());
    submitNewMessage();
  };
});

function submitNewMessage(){
  $("form#new_message").submit(function(e){
    textarea = $('[data-textarea="message"]');
    roomID = $("form#new_message input[id='message_chatroom_id']").val();
    App.chatRoom.send({message: textarea.val()});
    $('[data-textarea="message"]').val(" ");
    return false;
  });

  $("form#new_message").bind('ajax:complete', function() {
    $('[data-textarea="message"]').val(" ");
  });
  
}

function connectChatroom(roomID) {
  App.chatRoom = App.cable.subscriptions.create({channel: 'ChatroomsChannel', room: roomID },
    {
     received: function(data) {
       $("#messages").removeClass('hidden')
       return $('#messages').append(this.renderMessage(data));
     },
     renderMessage: function(data) {
       return "<p> <b>" + data.user + "(" + data.created_at + ")" + ": </b>" + data.message + "</p>";
     }
    }
  );
}
