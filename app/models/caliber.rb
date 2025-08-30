# == Schema Information
#
# Table name: calibers
#
#  id         :bigint           not null, primary key
#  name       :string
#  value      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Caliber < ApplicationRecord
  # Broadcast changes in realtime with Hotwire
  # after_create_commit -> { broadcast_prepend_later_to :calibers, partial: "calibers/index", locals: {caliber: self} }
  # after_update_commit -> { broadcast_replace_later_to self }
  # after_destroy_commit -> { broadcast_remove_to :calibers, target: dom_id(self, :index) }
end
