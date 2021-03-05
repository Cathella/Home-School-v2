class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :teacher, optional: true
  belongs_to :child, optional: true

  validates_presence_of :body, :conversation_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
