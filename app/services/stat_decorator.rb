class StatDecorator
  def initialize(product)
    @product = product
  end

  def orders_count
    @product.orders.count
  end

  def products_quantity
    @product.line_items.map{|product| product.quantity}.sum
  end

  def product_title
    @product.title
  end

  def orders_created
    @product.orders.map{|order| order.created_at}.map{|time| time.strftime('%I:%M %Y-%m-%d')}
  end

  def last_order_created
    @product.orders.map{|order| order.created_at}.map{|time| time.strftime('%I:%M %Y-%m-%d')}.last
  end

  def max_products_on_order
    @product.line_items.map{|x| x.quantity}.max
  end
end