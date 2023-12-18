class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find_by_id(params[:id])

    return unless @food.nil?

    redirect_to foods_path
  end
end
