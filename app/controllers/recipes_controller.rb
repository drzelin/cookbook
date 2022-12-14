class RecipesController < ApplicationController
  before_action :find_recipe, only: [:destroy, :edit, :show, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @recipe = Recipe.new(recipe_params)

    binding.pry
    # Ideally we'd ensure we grab an existing food item on the frontend rather 
    # than "sanitize" it on the backend but going to do this for now in the
    # interest of time
    @recipe.ingredients = sanitize_ingredients(@recipe.ingredients)
    @recipe.user_id = current_user.id

    if @recipe.save
      redirect_to @recipe
    else
      # Render does not do an entirely new http refresh, redirect would so it
      # would lose the data written
      render 'new'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def edit; end

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).includes(:food_items).
      order('created_at DESC')
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
      permit(:directions, :name, :prep_time_in_mins, :servings,
        directions_attributes: [:id, :description, :_destroy],
        ingredients_attributes: [:id, :amount, :unit, :_destroy,
          food_item_attributes: [:id, :name]] )
  end

  def sanitize_ingredients(ingredients)
    ingredients.each do |ingredient|
      food_item = ingredient.food_item
      ingredient.food_item = FoodItem.find_by(name: food_item.name) || food_item
    end
  end

  def search_params
    params.require(:search)
  end
end
