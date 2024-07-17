class Barangay < ApplicationRecord
  has_many :barangay_puroks, dependent: :destroy

  def get_total_families
    return self.barangay_puroks.sum(:population)
  end
end
