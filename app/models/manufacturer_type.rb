# == Schema Information
#
# Table name: manufacturer_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ManufacturerType < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # Broadcast changes in realtime with Hotwire
  # after_create_commit -> { broadcast_prepend_later_to :manufacturer_types, partial: "manufacturer_types/index", locals: {manufacturer_type: self} }
  # after_update_commit -> { broadcast_replace_later_to self }
  # after_destroy_commit -> { broadcast_remove_to :manufacturer_types, target: dom_id(self, :index) }
end
