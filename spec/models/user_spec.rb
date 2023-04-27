require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Abigiya Tadesse', username: 'AB', email: 'AB@gmail.com', password: '00000000',
             password_digest: '00000000')
  end

  before { subject.save }

  describe 'Validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password) }
  end

  describe 'Asscociations' do
        it { should have_many(:cars).through(:reservations) }
        it { should have_many(:reservations) }
  end
end