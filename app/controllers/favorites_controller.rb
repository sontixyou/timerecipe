class FavoritesController < ApplicationController

  before_action :set_favorite_recipe
  before_action :authenticate_user!

  def create
    
    Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
    redirect_to recipe_path
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @favorite.destroy
    redirect_to recipe_path
  end

  private
  def set_favorite_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
