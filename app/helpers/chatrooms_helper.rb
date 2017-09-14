module ChatroomsHelper
  def chatroom_create_and_broadcast_message(chatroom_id, content, current_user, **parameters)
  	content = CGI.escapeHTML(content)
    message = Chatroom.find(chatroom_id).messages.new(content: content, user_id: current_user.id)
    if message.save
      ActionCable.server.broadcast "chatrooms:#{message.chatroom_id}",
        message: message.content,
        user:    message.user.email,
        created_at: message.created_at_in_current_time_zone_short
    end
    message
  end
end
