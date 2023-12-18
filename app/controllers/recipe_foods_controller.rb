class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def show
    @recipe_foods = RecipeFood.find_by_id(params[:id])

    return unless @recipe_foods.nil?

    redirect_to recipe_foods_path
  end
end
