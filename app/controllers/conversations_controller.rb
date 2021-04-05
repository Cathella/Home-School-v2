class ConversationsController < ApplicationController
  def index
    @conversations = current_account.my_conversations
    @trash = current_account.trashed_conversations
  end

  def create
    @conversation = current_account.hato_converstions.build(conversation_params)
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      redirect_to :conversations, notice: @conversation.errors
    end
  end

  def show
    @conversation = Denshobato::Conversation.find(params[:id])
    redirect_to :conversations, notice: 'You cant join this conversation' unless user_in_conversation?(current_account, @conversation)

    @message_form = current_account.hato_messages.build
    @messages = @conversation.messages
  end

  def destroy
    @conversation = Deshobato::Conversation.find(params[:id])
    redirect_to :conversations if @conversation.destroy
  end

  %w(to_trash from_trash).each do |name|
    define_method name do
      room = Deshobato::Conversation.find(params[:id])
      room.send(name)
      redirect_to :conversations
    end
  end

  private

  def conversation_params
    params.require(:denshobato_conversation).permit(:sender_id, :sender_type, :recipient_id, :recipient_type)
  end
end
