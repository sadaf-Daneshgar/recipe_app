class ChangeDecimalsInFoods < ActiveRecord::Migration[7.1]
  def change
    change_column_default :foods, :quantity, 0
    change_column :foods, :price, :integer
    change_column :foods, :quantity, :integer
  end
end
