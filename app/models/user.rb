class User < ApplicationRecord
  validates :name, :email, :api_key, presence: true
  validates :email, :api_key, uniqueness: true


  def self.generate_api_key
    SecureRandom.urlsafe_base64
  end
end