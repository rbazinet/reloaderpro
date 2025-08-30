# frozen_string_literal: true

# class to keep all data for a cartridge
class Cartridge < ApplicationRecord
  belongs_to :cartridge_type
  has_many :bullet_weights, dependent: :destroy

  scope :for_cartridge_type, ->(cartridge_type_id) { where('cartridge_type_id = ?', cartridge_type_id) }

  validates :name, presence: true, uniqueness: { scope: [:name, :cartridge_type_id] }

  def self.for_select(cartridge_type_id)
    for_cartridge_type(cartridge_type_id).order(:name).map { |c| [c.name, c.id] }
  end
end
