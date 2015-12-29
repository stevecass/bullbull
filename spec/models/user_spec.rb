require 'rails_helper'

RSpec.describe User do 

  it 'responds to :email' do
    u = User.new
    expect(u).to respond_to(:email)
  end

  it 'requires an email address' do
    u = User.new
    expect(u.valid?).to eq(false)
  end

  context '#username_in_lower_case' do
    it 'returns the username in lower case' do
      u = User.new(username: 'Jimbo')
      expect(u.username_in_lower_case).to eq(u.username.downcase)
    end

    it 'tolerates nil username' do
      u = User.new
      expect(u.username_in_lower_case).to eq(nil)
    end
  end
  
end