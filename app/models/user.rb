class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password
  attr_accessor :current_password
  has_many :products

end