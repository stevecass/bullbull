class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations
  validates_presence_of :email, :username

  def username_in_lower_case
    return nil unless username
    username.downcase
  end
end
