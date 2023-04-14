class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..25 }
  validates :username, presence: true, uniqueness: true, length: { in: 2..25 }
end
