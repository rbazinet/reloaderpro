# frozen_string_literal: true

# class to capture all data from a reloading session
class ReloadingSession < ApplicationRecord
  broadcasts_refreshes

  belongs_to :account
  belongs_to :cartridge
  belongs_to :cartridge_type
  belongs_to :reloading_data_source
  belongs_to :bullet
  belongs_to :bullet_weight
  belongs_to :powder
  belongs_to :primer
  belongs_to :primer_type
end
