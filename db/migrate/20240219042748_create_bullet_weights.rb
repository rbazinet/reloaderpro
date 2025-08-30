class CreateBulletWeights < ActiveRecord::Migration[7.1]
  def change
    create_table :bullet_weights do |t|
      t.float :weight
      t.references :cartridge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
