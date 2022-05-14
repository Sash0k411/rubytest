module Admin
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy]

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

    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to admin_categories_path, notice: "Category #{@category.name} was successfully updated." }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @category.destroy
        respond_to do |format|
         format.html { redirect_to admin_categories_path, notice: "Category #{@category.name} was successfully deleted." }
        end
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name).to_hash
    end
  end
end