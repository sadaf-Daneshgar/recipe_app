class PublicRecipesController < ApplicationController
  def index
    @p_recipes = Recipe.where(public: true)
  end

end
