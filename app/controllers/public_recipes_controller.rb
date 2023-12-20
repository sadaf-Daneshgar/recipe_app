class PublicRecipesController < ApplicationController
  def index
    @p_recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
