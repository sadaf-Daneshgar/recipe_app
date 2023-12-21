require 'rails_helper'

RSpec.describe 'Testing Recipe#show view, it', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Test Recipe', description: 'Test Description',
                            preparation_time: 10, cooking_time: 10,
                            public: false, user_id: @user.id)
    visit user_recipe_path(@user, @recipe)
  end

  it 'should display the name of the recipe' do
    expect(page).to have_content(@recipe.name)
  end

  it 'should display the description of the recipe' do
    expect(page).to have_content(@recipe.description)
  end

  it 'should display the preparation time of the recipe' do
    expect(page).to have_content(@recipe.preparation_time)
  end

  it 'should display the cooking time of the recipe' do
    expect(page).to have_content(@recipe.cooking_time)
  end

  it 'should have a checkbox to mark the recipe as public, and it should change when enabled' do
    expect(page).to have_field('recipe_public')
    expect(page).to have_unchecked_field('recipe_public')
    check('recipe_public')
    expect(page).to have_checked_field('recipe_public')
  end

  it 'should have a button to add an ingredient' do
    expect(page).to have_button('Add ingredients')
  end

  it 'should have a button to generate a shopping list' do
    expect(page).to have_button('Generate Shopping List')
  end
end
