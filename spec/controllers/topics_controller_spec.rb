require 'rails_helper'

RSpec.describe TopicsController do 

  describe '#index' do
    it 'loads a list of topics' do
      Topic.create!(name:'Hello')
      Topic.create!(name:'Goodbye')
      get :index
      expect(assigns(:topics)).to match(Topic.order(updated_at: :desc))
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

  end
end