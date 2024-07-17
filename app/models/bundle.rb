class Bundle < ApplicationRecord
  has_many :bundle_items
  has_many :items, through: :bundle_items

  has_many :vehicle_bundles
  has_many :vehicles, through: :vehicle_bundles

  after_destroy :destroy_related_stuff

  def get_bundle_qty
    bundle_qty = 1 << 64
    self.bundle_items.each do |bi|
      result = bi.item.stock / bi.quantity
      if result < bundle_qty
        bundle_qty = result
      end
    end

    return bundle_qty
  end

  private
  def destroy_related_stuff
    self.bundle_items.destroy_all
    self.vehicle_bundles.destroy_all
  end
end
