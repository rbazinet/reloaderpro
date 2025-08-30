# frozen_string_literal: true

# class to distinguish cartridge types
class CartridgeType < ApplicationRecord
  has_many :cartridges, dependent: :destroy
  has_many :reloading_sessions, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.for_select
    all.map { |c| [c.name, c.id] }
  end
end
