class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
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

  private 

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end