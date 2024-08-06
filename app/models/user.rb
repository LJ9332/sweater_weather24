class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  before_create :create_api_key

  has_secure_password

  private
  def create_api_key
    self.api_key = SecureRandom.hex(16)
  end
end