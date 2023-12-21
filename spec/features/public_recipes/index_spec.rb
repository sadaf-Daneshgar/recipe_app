require 'rails_helper'

RSpec.describe 'Testing PublicRecipe#index view, it', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    @user.confirm
    sign_in @user
    @p_recipe = Recipe.create(name: 'Public Recipe', description: 'Test Description',
                              preparation_time: 10, cooking_time: 10,
                              public: true, user_id: @user.id)
    4.times do |i|
      Recipe.create(name: "Recipe ##{i}", description: "Description ##{i}",
                    preparation_time: 10, cooking_time: 10,
                    public: false, user_id: @user.id)
    end
    visit public_recipes_path
  end

  it 'display only the public recipe' do
    expect(page).to have_content(@p_recipe.name)
  end

  it 'display the public recipe description' do
    expect(page).to have_content(@p_recipe.description)
  end

  it 'display a remove button for the public recipe' do
    expect(page).to have_button('Remove')
  end

  it 'link the public recipe to its show page' do
    expect(page).to have_link(@p_recipe.name, href: user_recipe_path(@p_recipe.user, @p_recipe))
  end

  it 'not allow other users to remove the public recipe, if they are not the owner' do
    new_user = User.create(name: 'User Test', email: 'test@example.com', password: '234567')
    new_user.confirm
    sign_in new_user
    visit public_recipes_path
    expect(page).to have_button('Remove', disabled: true)
  end
end
