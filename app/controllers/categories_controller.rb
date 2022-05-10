class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show index]


  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: "Category #{@category.name} was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
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