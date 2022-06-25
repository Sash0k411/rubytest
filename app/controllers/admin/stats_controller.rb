module Admin
  class StatsController < ApplicationController
    def index
      @stats = Product.includes(:line_items, :orders).map{|product| StatDecorator.new(product)}
    end
  end
end