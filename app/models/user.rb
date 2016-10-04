class User < ApplicationRecord
  # Extensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relationships
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  def name
    email.split('@')[0]
  end
end
