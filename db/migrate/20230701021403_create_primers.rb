class CreatePrimers < ActiveRecord::Migration[7.0]
  def change
    create_table :primers do |t|
      t.string :name
      t.integer :manufacturer_id

      t.timestamps
    end
  end
end
