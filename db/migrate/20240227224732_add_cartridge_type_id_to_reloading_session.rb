class AddCartridgeTypeIdToReloadingSession < ActiveRecord::Migration[7.1]
  def change
    add_reference :reloading_sessions, :cartridge_type, null: false, foreign_key: true
  end
end
