module Admin
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]

    def index
      @products = Product.all.order(:title)
    end

    def show
    end

    def new
      @product = Product.new
    end

    def edit
    end

    def create
      @product = Product.new(product_params.merge({"user_id" => current_user.id}))
      respond_to do |format|
        if @product.save
          format.html { redirect_to admin_products_url(@product), notice: "Product was successfully created." }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to admin_products_url(@product), notice: "Product was successfully updated." }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @product.destroy

      respond_to do |format|
        format.html { redirect_to admin_product_path, notice: "Product was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:title, :description, :image_url, :price, :discount, :category_id).to_hash
      end
  end
end
