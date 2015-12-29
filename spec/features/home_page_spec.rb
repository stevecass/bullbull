require 'rails_helper'

RSpec.feature 'Home page' do 
  def log_user_in(u)
    visit login_path
    fill_in('username', with: u.username)
    fill_in('password', with: u.password)
    click_button('Login')
  end
  
    describe 'visit home page' do
       it 'shows a list of topics' do
         topic = FactoryGirl.create(:topic)
         visit '/'
         expect(page).to have_selector('[data-purpose="topic-list"]')
         expect(page).to have_content(topic.name)
       end
    end

    describe 'when logged in' do
      it 'shows a welcome message' do
        u = FactoryGirl.create(:user)
        log_user_in u
        expect(page).to have_content("Welcome #{u.username}")
        save_and_open_page
      end
    end

    describe 'clicking a topic' do
      it 'shows the conversations in the topic' do
        conv = FactoryGirl.create(:conversation)
        u = FactoryGirl.create(:user)
        log_user_in u
        visit topic_path(conv.topic)
        save_and_open_page
      end
    end

  
  
end