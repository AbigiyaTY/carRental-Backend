require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  describe 'Associations ' do
    it { should belong_to(:user) }
    it { should belong_to(:car) }
  end
end
