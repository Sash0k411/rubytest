require 'pago'
require 'csv'
class Order < ApplicationRecord
  # include SpreadsheetArchitect

  has_many :line_items, dependent: :destroy
  enum pay_type: {
    "Check"  => 0,
    "Credit card"  => 1,
    "Purchase order" => 2
  }
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def charge!(pay_type_params)
    payment_details = {}
    payment_method = nil
    case pay_type
    when "Check"
      payment_method = :check
      payment_details[:routing] = pay_type_params[:routing_number]
      payment_details[:account] = pay_type_params[:account_number]
    when "Credit card"
      payment_method = :credit_card
      month,year = pay_type_params[:expiration_date].split(//)
      payment_details[:cc_num] = pay_type_params[:credit_card_number]
      payment_details[:expiration_month] = month
      payment_details[:expiration_year] = year
    when "Purchase order"
      payment_method = :po
      payment_details[:po_num] = pay_type_params[:po_number]
    end
    payment_result = Pago.make_payment(
      order_id: id,
      payment_method: payment_method,
      payment_details: payment_details
    )
    if payment_result.succeeded?
      OrderMailer.received(self).deliver_later
    else
      raise payment_result.error
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |order|
        order_params = order.attributes
        order_params["created_at"] = order_params["created_at"].strftime('%Y-%m-%d')
        order_params["updated_at"] = order_params["updated_at"].strftime('%Y-%m-%d')

        csv << order_params.values_at(*column_names)
      end
    end
  end

  # def spreadsheet_columns
  #   [
  #     ['id', :id],
  #     ['name', :name],
  #     ['address:', :address],
  #     ['email:', :email],
  #     ['created_at:', :created_at],
  #     ['updated_at', :updated_at]
  #   ]
  # end
end
