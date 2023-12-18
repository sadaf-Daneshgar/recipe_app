class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])

    return unless @recipe.nil?

    redirect_to recipes_path
  end
end
