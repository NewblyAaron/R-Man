class VehicleBundle < ApplicationRecord
  belongs_to :vehicle
  belongs_to :bundle

  validates :vehicle_id, :bundle_id, :quantity, presence: true
  validates :bundle_id, uniqueness: { scope: :vehicle_id, message: "cannot have any duplicates" }
  validate :quantity, :load_limit

  def load_limit
    if quantity > vehicle.capacity
      errors.add(:quantity, "can't go past the vehicle capacity limit")
    end
  end
end
