class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def new
    @user = current_user
    @recipe = @user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to user_recipes_path(current_user)
    else
      puts @recipe.errors.full_messages
      render :new
    end
  end

  def destroy
    @recipe = current_user.recipes.includes(:recipe_foods).find(params[:id])
    RecipeFood.where(recipe_id: @recipe.id).destroy_all
    @recipe.destroy

    redirect_to user_recipes_path(current_user), notice: 'Recipe was successfully destroyed.'
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to user_recipe_path(@user, @recipe), notice: 'Recipe was successfully updated.'
    else
      render :show
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
