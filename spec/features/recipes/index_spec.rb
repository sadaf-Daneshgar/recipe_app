require 'rails_helper'

RSpec.describe 'Testing Recipe#index view, it', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Test Recipe', description: 'Test Description',
                            preparation_time: 10, cooking_time: 10,
                            public: true, user_id: @user.id)
    5.times do |i|
      Recipe.create(name: "Recipe ##{i}", description: "Description ##{i}",
                    preparation_time: 10, cooking_time: 10,
                    public: false, user_id: @user.id)
    end
    visit user_recipes_path(@user)
  end

  it 'display the name of each of the recipes' do
    expect(page).to have_content(@recipe.name)
    5.times { |i| expect(page).to have_content("Recipe ##{i}") }
  end

  it 'display the description of the recipes' do
    expect(page).to have_content(@recipe.description)
  end

  it 'display a button to add a new food' do
    expect(page).to have_link('New Recipe', href: new_user_recipe_path(@user))
  end

  it 'navigate to a new page when the button to add a new food is clicked' do
    click_link('New Recipe', href: new_user_recipe_path(@user))
    expect(page).to have_current_path(new_user_recipe_path(@user))
  end
end
