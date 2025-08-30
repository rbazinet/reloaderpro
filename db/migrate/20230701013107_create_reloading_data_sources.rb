class CreateReloadingDataSources < ActiveRecord::Migration[7.0]
  def change
    create_table :reloading_data_sources do |t|
      t.string :name

      t.timestamps
    end
  end
end
