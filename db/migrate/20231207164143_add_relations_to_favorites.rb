class AddRelationsToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_reference :favorites, :place, index: true
    add_reference :favorites, :user, index: true
  end
end
