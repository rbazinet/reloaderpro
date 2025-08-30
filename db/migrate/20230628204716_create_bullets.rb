class CreateBullets < ActiveRecord::Migration[7.0]
  def change
    create_table :bullets do |t|
      t.string :name
      t.decimal :weight
      t.decimal :length
      t.decimal :sd
      t.decimal :bc
      t.references :manufacturer, null: false, foreign_key: true
      t.references :caliber, null: false, foreign_key: true

      t.timestamps
    end
  end
end
