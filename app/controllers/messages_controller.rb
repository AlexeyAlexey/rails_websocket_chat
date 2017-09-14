class MessagesController < ApplicationController
  include ChatroomsHelper
  
  before_action :authenticate_user!
  
  # POST /messages
  def create
    chatroom_create_and_broadcast_message(message_params[:chatroom_id], message_params[:content], current_user)
    head :ok
  end

  private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end
end
