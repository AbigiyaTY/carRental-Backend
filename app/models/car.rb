class Car < ApplicationRecord
    validates :car_name, :model, :year, :color, :image, :price, presence: true
end
