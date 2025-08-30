# == Schema Information
#
# Table name: primers
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  manufacturer_id :integer
#
class Primer < ApplicationRecord
  belongs_to :manufacturer

  validates :name, presence: true, uniqueness: true
  validates_associated :manufacturer

  # Broadcast changes in realtime with Hotwire
  # after_create_commit -> { broadcast_prepend_later_to :primers, partial: "primers/index", locals: {primer: self} }
  # after_update_commit -> { broadcast_replace_later_to self }
  # after_destroy_commit -> { broadcast_remove_to :primers, target: dom_id(self, :index) }
end
