class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @user = User.find(params[:current_user])
    @recipe = @user.recipes.find_by_id(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to user_recipes_path(current_user)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
