class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password
  attr_accessor :current_password
  validate :current_password_is_correct, on: :update

  def current_password_is_correct

    return if password.blank?

    user = User.find(id)

    if user.authenticate(current_password) == false

      errors.add(:current_password, "is incorrect.")
    end
  end
end
