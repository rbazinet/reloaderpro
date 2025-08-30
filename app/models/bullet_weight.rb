# frozen_string_literal: true
# class for bullet weights
class BulletWeight < ApplicationRecord
  belongs_to :cartridge

  scope :for_cartridge, ->(cartridge_id) { where('cartridge_id = ?', cartridge_id) }

  validates :weight, presence: true, uniqueness: { scope: [:weight, :cartridge_id] }

  def self.for_select(cartridge_id)
    for_cartridge(cartridge_id).order(:weight).map { |bw| [bw.weight, bw.id] }
  end
end
