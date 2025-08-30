class CreateReloadingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :reloading_sessions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :cartridge, null: false, foreign_key: true
      t.datetime :loaded_at
      t.references :reloading_data_source, null: false, foreign_key: true
      t.references :bullet, null: false, foreign_key: true
      t.string :bullet_type
      t.references :bullet_weight, null: false, foreign_key: true
      t.decimal :bullet_weight_other
      t.references :powder, null: false, foreign_key: true
      t.decimal :powder_weight
      t.references :primer, null: false, foreign_key: true
      t.references :primer_type, null: false, foreign_key: true
      t.decimal :cartridge_overall_length
      t.integer :quantity
      t.text :notes

      t.timestamps
    end
  end
end
