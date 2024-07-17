class Item < ApplicationRecord
  has_many :bundle_items
  has_many :bundles, through: :bundle_items

  after_destroy :destroy_bundle_items

  private
  def destroy_bundle_items
    self.bundle_items.destroy_all
  end
end
