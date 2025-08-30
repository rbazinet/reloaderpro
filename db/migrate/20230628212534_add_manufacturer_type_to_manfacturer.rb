class AddManufacturerTypeToManfacturer < ActiveRecord::Migration[7.0]
  def change
    add_column :manufacturers, :manufacturer_type_id, :integer
  end
end
