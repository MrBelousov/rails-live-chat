class ChatRoom < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :messages, dependent: :destroy
end
