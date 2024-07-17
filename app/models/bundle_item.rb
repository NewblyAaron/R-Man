class BundleItem < ApplicationRecord
  belongs_to :bundle
  belongs_to :item

  validates :bundle_id, :item_id, :quantity, presence: true
  validates :item_id, uniqueness: { scope: :bundle_id, message: "cannot have any duplicates" }
end