class MessagesController < ApplicationController
  def create
    @msg = current_user.messages.build(set_message)
    if current_user.save
      render json: { status: 200, message: @msg, user: @msg.user }
    end
  end

  private
  def set_message
    params.require(:message).permit(:body, :room_id)
  end
end