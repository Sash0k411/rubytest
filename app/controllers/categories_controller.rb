class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
      respond_to do |format|
        if @category.save
          format.html { redirect_to categories_url, notice: "Category #{@category.name} was successfully created." }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: "Category #{@category.name} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
      respond_to do |format|
       format.html { redirect_to category_url, notice: "Category #{@category.name} was successfully deleted." }
      end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end