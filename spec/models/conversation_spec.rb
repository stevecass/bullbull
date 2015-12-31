require 'rails_helper'

RSpec.describe Conversation do
  it { should validate_presence_of :name }
 
end