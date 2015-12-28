class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :conversations

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def conversations_most_recent_first
    conversations.order(updated_at: :desc)
  end

end
