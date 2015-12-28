class ConversationsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @conv  = Conversation.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @conv = @topic.conversations.build(conv_params)
    if @conv.save
      redirect_to topic_conversations_path(@topic)
    else
      render :index
    end
  end

  private 
  def conv_params
     params.require(:conversation).permit(:name)
  end

end