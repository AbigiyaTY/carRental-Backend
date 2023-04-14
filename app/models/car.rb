class Car < ApplicationRecord
    has_many :reservations, dependent: :destroy
    has_many :users, through: :reservations

    validates :car_name, :model, :year, :color, :image, :price, presence: true
end
