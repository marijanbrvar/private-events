require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user name presence' do
    it 'If user name not present' do
      u = User.new
      u.name = ''
      u.valid?
      expect(u.errors[:name]).to include("can't be blank")
    end
  end
end