class Message < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :chat_room

  # Validations
  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }

  # Callbacks
  after_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
