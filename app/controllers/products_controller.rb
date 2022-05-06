class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show index ]



  # GET /products or /products.json
  def index
    @products = Product.all.order(:title)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :discount, :category_id).to_hash
  end
end