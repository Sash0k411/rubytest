class SwitchCurrency < ActiveRecord::Migration[6.0]
  def change
    add_column  :products, :price_on_eur,  :decimal, precision: 8, scale: 2
    add_column :products, :price_on_rub, :decimal, precision: 8, scale: 2
  end
end
