class RecipesController < ApplicationController
  before_action :find_recipe, only: [:destroy, :edit, :show, :update]

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save

    redirect_to @recipe
  end

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def show; end

  private

  def find_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).
      permit(:directions, :name, :prep_time_in_mins, :servings)
  end
end
