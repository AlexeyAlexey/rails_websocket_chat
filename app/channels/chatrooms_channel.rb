class ChatroomsChannel < ApplicationCable::Channel 
  include ChatroomsHelper

  def subscribed
    stream_from "chatrooms:#{params[:room]}"
  end

  def receive(data)
  	chatroom_create_and_broadcast_message(params[:room], data["message"], current_user)
  end
end