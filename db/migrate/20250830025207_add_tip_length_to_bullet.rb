class AddTipLengthToBullet < ActiveRecord::Migration[8.0]
  def change
    add_column :bullets, :tip_length, :decimal
  end
end
