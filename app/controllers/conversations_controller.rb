class ConversationsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
  end
end