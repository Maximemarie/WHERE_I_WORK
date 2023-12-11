class AddReferencesToFilters < ActiveRecord::Migration[7.1]
  def change
    add_reference :filters, :place, index: true
  end
end
