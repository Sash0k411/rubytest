module Admin
  class StatsController < ApplicationController
    def index
      @stats = Product.includes(:line_items).includes(:orders).map{|product| StatDecorator.new(product)}
    end
  end
end