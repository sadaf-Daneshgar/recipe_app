require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create(email: 'sadaf@example.com', password: 'password')
    @recipe = Recipe.new(
      name: 'Potato',
      preparation_time: 10,
      cooking_time: 20,
      description: 'Boil the potato',
      public: true,
      user: @user
    )
    @food = Food.new(
      name: 'Potato',
      quantity: 100
    )
    @recipe_food = RecipeFood.new(
      quantity: 100,
      recipe: @recipe,
      food: @food
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'is not valid without a quantity' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'is not valid with a non-positive quantity' do
      @recipe_food.quantity = -1
      expect(@recipe_food).to_not be_valid
    end
  end
end
