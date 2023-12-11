class CreateFilters < ActiveRecord::Migration[7.1]
  def change
    create_table :filters do |t|
      t.boolean :outlets
      t.boolean :vegan
      t.boolean :gluten_free
      t.boolean :wifi
      t.string :ambiance

      t.timestamps
    end
  end
end
