# frozen_string_literal: true

# == Schema Information
#
# Table name: primer_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PrimerType < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # Broadcast changes in realtime with Hotwire
  # after_create_commit -> { broadcast_prepend_later_to :primer_types, partial: "primer_types/index", locals: {primer_type: self} }
  # after_update_commit -> { broadcast_replace_later_to self }
  # after_destroy_commit -> { broadcast_remove_to :primer_types, target: dom_id(self, :index) }
end
