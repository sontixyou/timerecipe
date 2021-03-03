class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :authenticate_user!, except: [:index, :show, :search]
  # before_action :set_item, only: [:edit, :show, :update, :destroy]
  # before_action :move_to_index, only: [:edit, :destroy, :update]

  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :detail, :recipe_info1, :recipe_info2, 
                                 :recipe_info3, :recipe_info4, :recipe_info5, :recipe_time_id, :image).merge(user_id: current_user.id)
  end

  # def set_recipe
  #   @recipe = Recipe.find(params[:id])
  # end

  # def move_to_index
  #   if current_user.id == @recipe.user_id
  #     redirect_to root_path
  #   end
  # end

end

