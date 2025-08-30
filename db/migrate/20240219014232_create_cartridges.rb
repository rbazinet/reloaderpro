class CreateCartridges < ActiveRecord::Migration[7.1]
  def change
    create_table :cartridges do |t|
      t.string :name
      t.references :cartridge_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
