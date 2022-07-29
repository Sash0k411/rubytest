require 'net/http'
require 'json'

class CurrencySwitcher

  def initialize(product)
    @product = product
  end

  def product_title
    @product.title
  end

  def product_image
    @product.image_url
  end

  def product_description
    @product.description
  end

  def product_category
    @product.category
  end

  def product_id
    @product.id
  end

  def product_price_with_discount
    @product.price_with_discount
  end

  def price_on_euro
    url = "https://api.exchangerate.host/latest?base=USD"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)
    @product.price_with_discount * response_obj["rates"]["EUR"]
  end

  def price_on_rubles
    url = "https://api.exchangerate.host/latest?base=USD"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)
    @product.price_with_discount * response_obj["rates"]["RUB"]
  end
end