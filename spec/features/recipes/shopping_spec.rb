require 'rails_helper'

RSpec.describe 'Testing Recipe#show view, it', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    @user2 = User.create(name: 'User Test', email: 'test@example.com', password: '234567')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Test Recipe', description: 'Test Description',
                            preparation_time: 10, cooking_time: 10,
                            public: false, user_id: @user.id)
    @food = Food.create(name: 'Test Food', measurement_unit: 'test', price: 10, user_id: @user2.id)
    @food2 = Food.create(name: "Food #2", measurement_unit: 'unit', price: 1, user_id: @user.id)

    @recipe_food = RecipeFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 10)

    visit user_recipe_path(@user, @recipe)

    click_button('Add ingredients')
    select(@food2.name, from: 'Food')
    fill_in('recipe_food_quantity', with: 10)
    click_button('Add Ingredient')
  end

  it 'should visit the shopping list' do
    click_button('Generate Shopping List')
    expect(page).to have_content('Total food items: 1')
    expect(page).to have_content('Total price: $100')
    expect(page).to have_content('Test Food 10 test')
  end
end