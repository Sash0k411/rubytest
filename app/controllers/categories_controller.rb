class CategoriesController < ApplicationController
  before_action :show, only: %i[ show index]


  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @books = @category.products

    render "/categories/_books"
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name).to_hash
  end
end