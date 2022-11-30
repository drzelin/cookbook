class RecipesController < ApplicationController
  before_action :find_recipe, only: [:destroy, :edit, :show, :update]

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      # Render does not do an entirely new http refresh, redirect would so it
      # would lose the data written
      render 'new'
    end
  end

  def edit; end

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def show; end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).
      permit(:directions, :name, :prep_time_in_mins, :servings)
  end
end
