class TopicsController < ApplicationController
  skip_before_action :ensure_logged_in, only:[:index, :show]

  def index
    @topics = Topic.order(updated_at: :desc)
  end

  def show
    topic = Topic.find(params[:id])
    redirect_to topic_conversations_path(topic)
  end
end