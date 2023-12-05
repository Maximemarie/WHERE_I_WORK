class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.string :location
      t.integer :availability
      t.string :menu
      t.integer :rating
      t.string :contact_details
      t.time :opening_hour

      t.timestamps
    end
  end
end
