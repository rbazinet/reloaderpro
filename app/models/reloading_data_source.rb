# == Schema Information
#
# Table name: reloading_data_sources
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ReloadingDataSource < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # Broadcast changes in realtime with Hotwire
  # after_create_commit -> { broadcast_prepend_later_to :reloading_data_sources, partial: "reloading_data_sources/index", locals: {reloading_data_source: self} }
  # after_update_commit -> { broadcast_replace_later_to self }
  # after_destroy_commit -> { broadcast_remove_to :reloading_data_sources, target: dom_id(self, :index) }

  def self.for_select
    all.order(:name).map { |c| [c.name, c.id] }
  end
end
