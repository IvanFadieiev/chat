class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @msg = current_user.messages.build(set_message)
    if current_user.save
      render json: { status: 200, message: @msg, user: @msg.user }
    end
  end

  def message
    message = Message.find(params[:message_id])
    render partial: 'rooms/message', locals: {:message => message}
  end

  def destroy
    message = Message.where(id: params[:id]).first
    message.destroy
    render json: { status: :ok, nothing: true }
  end

  private
  def set_message
    params.require(:message).permit(:body, :room_id)
  end
end