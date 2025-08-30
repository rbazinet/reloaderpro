# frozen_string_literal: true

# == Schema Information
#
# Table name: bullets
#
#  id              :bigint           not null, primary key
#  bc              :decimal(, )
#  length          :decimal(, )
#  name            :string
#  sd              :decimal(, )
#  weight          :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  caliber_id      :bigint           not null
#  manufacturer_id :bigint           not null
#
# Indexes
#
#  index_bullets_on_caliber_id       (caliber_id)
#  index_bullets_on_manufacturer_id  (manufacturer_id)
#
# Foreign Keys
#
#  fk_rails_...  (caliber_id => calibers.id)
#  fk_rails_...  (manufacturer_id => manufacturers.id)
#
class Bullet < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :caliber

  # Broadcast changes in realtime with Hotwire
  # after_create_commit -> { broadcast_prepend_later_to :bullets, partial: "bullets/index", locals: {bullet: self} }
  # after_update_commit -> { broadcast_replace_later_to self }
  # after_destroy_commit -> { broadcast_remove_to :bullets, target: dom_id(self, :index) }
end
