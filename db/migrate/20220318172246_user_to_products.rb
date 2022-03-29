class UserToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :user
  end
end
