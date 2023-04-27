class User < ApplicationRecord
  require 'securerandom'
  has_secure_password

  has_many :reservations
  has_many :cars, through: :reservations

  validates :name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..25 }
  validates :username, presence: true, uniqueness: true, length: { in: 2..25 }

  ROLES = %i[admin user].freeze

  validates :role, inclusion: { in: ROLES.map(&:to_s) }

  def is?(requested_role)
    role == requested_role.to_s
  end

  def admin?
    role.to_sym == :admin
  end
end
