class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :discount, numericality: { greater_than_or_equal_to: 0}
  belongs_to :user, optional: true
  belongs_to :category, optional: true


  # def price_on_eur
  #   url = "https://api.exchangerate.host/latest?base=USD"
  #   uri = URI(url)
  #   response = Net::HTTP.get(uri)
  #   response_obj = JSON.parse(response)
  #   return self.price_on_eur if self.price.nil? || self.price.zero?
  #   self.price_with_discount * response_obj["rates"]["EUR"]
  # end
  #
  # def price_on_rub
  #   url = "https://api.exchangerate.host/latest?base=USD"
  #   uri = URI(url)
  #   response = Net::HTTP.get(uri)
  #   response_obj = JSON.parse(response)
  #
  #   return self.price_on_rub if self.price.nil? || self.price.zero?
  #   self.price_with_discount * response_obj["rates"]["RUB"]
  # end

  def price_with_discount
    return self.price if self.discount.nil? || self.discount.zero?
    self.price - (self.price * self.discount / 100)
  end

  private

# ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
