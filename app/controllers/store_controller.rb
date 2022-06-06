class StoreController < ApplicationController
  include CurrentCart
  before_action :set_locale

  def index
    @products = Product.order(params[:sort]).page params[:page]
  end

  def search
    if params[:search].blank?
      redirect_to store_index_path and return
    else
      @parameter = params[:search].downcase
      @products = Product.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end
  end


  private

  def set_locale
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    end
  end
end
