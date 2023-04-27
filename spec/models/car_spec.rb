require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:car_name) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:price) }
  end

  describe 'associatons' do
    it { should have_many(:users).through(:reservations) }
    it { should have_many(:reservations) }
  end
end
