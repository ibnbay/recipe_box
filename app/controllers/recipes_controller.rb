class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Sukses membuat resep baru"
    else
      render 'new'
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Sukses update resep"
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Berhasil menghapus resep"
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, bahans_attributes:[:id, :name, :_destroy],
                                   tahapans_attributes:[:id,:step,:_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
