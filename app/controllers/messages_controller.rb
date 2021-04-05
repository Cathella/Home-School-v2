class MessagesController < ApplicationController
  def create
    conversation_id = params[:denshobato_message][:conversation_id]
    @message = current_account.send_message_to(conversation_id, message_params)

    if @message.save
      @message.send_notification(conversation_id)
      redirect_to conversation_path(conversation_id), notice: 'Message sent'
    else
      redirect_to conversation_path(conversation_id), notice: @message.errors
    end
  end

  private

  def message_params
    params.require(:denshobato_message).permit(:body, :author_id, :author_type)
  end
end
