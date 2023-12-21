require 'rails_helper'

RSpec.describe Recipe, type: :model do
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
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@recipe).to be_valid
    end

    it 'is not valid without a name' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a preparation time' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid with a non-positive preparation time' do
      @recipe.preparation_time = -1
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a cooking time' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid with a non-positive cooking time' do
      @recipe.cooking_time = -1
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a public' do
      @recipe.public = nil
      expect(@recipe).to_not be_valid
    end
  end
end
