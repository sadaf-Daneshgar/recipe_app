require 'rails_helper'

RSpec.describe 'Testing RecipeFood#new view, it', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Recipe', description: 'Test Description',
                            preparation_time: 10, cooking_time: 10,
                            public: true, user_id: @user.id)
    @food = Food.create(name: 'Test Food', measurement_unit: 'test', price: 10, user_id: @user.id)
    visit new_user_recipe_recipe_food_path(@user, @recipe)
  end

  it 'display a form to add a new recipe food' do
    expect(page).to have_field('recipe_food_food_id')
    expect(page).to have_field('recipe_food_quantity')
    expect(page).to have_button('Add Ingredient')
  end

  it 'should be able to add a new item' do
    expect(page).to have_button('Add Ingredient')
  end

  it 'add a food to the recipe when the form is submitted' do
    select(@food.name, from: 'Food')
    fill_in('recipe_food_quantity', with: 10)
    click_button('Add Ingredient')
    expect(page).to have_current_path(user_recipe_path(@user, @recipe))
    expect(page).to have_content('Test Food')
  end
end
