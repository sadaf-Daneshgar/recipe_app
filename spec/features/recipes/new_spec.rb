require 'rails_helper'

RSpec.describe 'Testing Recipe#new view, it', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    @user.confirm
    sign_in @user
    visit new_user_recipe_path(@user)
  end

  it 'display a form to create a new food' do
    expect(page).to have_field('recipe_name')
    expect(page).to have_field('recipe_description')
    expect(page).to have_field('recipe_preparation_time')
    expect(page).to have_field('recipe_cooking_time')
    expect(page).to have_field('recipe_public')
    expect(page).to have_button('Create Recipe')
  end

  it 'create a new food when the form is submitted' do
    fill_in('recipe_name', with: 'Test Recipe')
    fill_in('recipe_description', with: 'Test Description')
    fill_in('recipe_preparation_time', with: 10)
    fill_in('recipe_cooking_time', with: 10)
    click_button('Create Recipe')
    expect(page).to have_current_path(user_recipes_path(@user))
    expect(page).to have_content('Test Recipe')
  end
end