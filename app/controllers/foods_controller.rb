class FoodsController < ApplicationController
  def index
    @user = User.includes(:foods).find(params[:user_id])
    @food = @user.foods
  end

  def new
    @user = current_user
    @food = @user.foods.build
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to user_foods_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    RecipeFood.where(food_id: @food.id).destroy_all
    @food.destroy
    redirect_to user_foods_path(current_user), notice: 'Food successfully deleted'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
