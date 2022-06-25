class StatDecorator

  TIME_FORMAT = '%I:%M %Y-%m-%d'
  def initialize(product)
    @product = product
    @orders = @product.orders
    @line_items = @product.line_items
  end

  def orders_count
    @orders.count
  end

  def products_quantity
    @line_items.map{|product| product.quantity}.sum
  end

  def product_title
    @product.title
  end

  def orders_created
    @orders.map{|order| order.created_at}.map{|time| time.strftime(TIME_FORMAT)}.join(', ')
  end

  def last_order_created
    @orders.map{|order| order.created_at}.map{|time| time.strftime(TIME_FORMAT)}.last
  end

  def max_products_on_order
    @line_items.map{|x| x.quantity}.max
  end
end