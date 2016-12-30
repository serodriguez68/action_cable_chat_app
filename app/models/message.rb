class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }

  # Returns an AR Relation of all users @mentioned in a message content
  def mentions
    User.where(username: content.scan(/@(#{User::NAME_REGEX})/).flatten)
  end

  def others_mentioned
    mentions.where.not(id: user_id)
  end
end
