class ChangeQuantityToIntInRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    change_column :recipe_foods, :quantity, :integer
  end
end
