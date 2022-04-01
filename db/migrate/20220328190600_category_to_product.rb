class CategoryToProduct < ActiveRecord::Migration[6.0]
  def change
     add_reference :products, :category, type: :string
  end
end
