require 'rails_helper'

RSpec.describe ConversationsController do 
  
  before(:each) do
    u = User.create!(email:'steven@example.com', username:'steven', password:'123456')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(u)
  end

  describe '#create' do
    it 'creates a conversation' do
      topic = Topic.create!(name:'Test topic')
      expect{post :create, {topic_id:topic.id, conversation:{ name:'New conversation'}} }.to change{Conversation.count}.by(1)
    end

    it 'redirects after creating a conversation' do
      topic = Topic.create!(name:'Test topic')
      post :create, {topic_id:topic.id, conversation:{ name:'New conversation'}}
      expect(response).to redirect_to topic_conversations_path(topic)
    end

    it 'does not create a conversation without a name' do
      topic = Topic.create!(name:'Test topic')
      expect{post :create, {topic_id:topic.id, conversation:{ name:''}} }.to_not change{Conversation.count}
    end

    it 'does not redirect if conv not created' do
      topic = Topic.create!(name:'Test topic')
      post :create, {topic_id:topic.id, conversation:{ name:''}}
      expect(response).to render_template(:index)
    end



  end
end