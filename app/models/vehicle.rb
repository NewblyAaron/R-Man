class Vehicle < ApplicationRecord
  has_many :vehicle_bundles
  has_many :bundles, through: :vehicle_bundles
end
