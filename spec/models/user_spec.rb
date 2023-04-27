require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Abigiya Tadesse', username: 'AB', email: 'AB@gmail.com', password: '00000000',
             password_digest: '00000000')
  end

  before { subject.save }

  it 'Name must not be blank' do
    subject.name = 'Abigiya'
    expect(subject).to be_valid
  end

  it 'Username must not be blank' do
    subject.username = 'AB'
    expect(subject).to be_valid
  end

  it 'Email must not be blank' do
    subject.email = 'AB@gmail.com'
    expect(subject).to be_valid
  end

  it 'Password must not be blank' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'Password confirmation must not be blank' do
    subject.password_digest = nil
    expect(subject).to_not be_valid
  end

  describe 'Validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password) }
  end

  describe 'asscociations' do
        it { should have_many(:cars).through(:reservations) }
        it { should have_many(:reservations) }
  end
end