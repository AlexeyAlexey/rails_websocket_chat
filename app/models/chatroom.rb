class Chatroom < ApplicationRecord
  has_many :messages, -> { order("created_at ASC") }, dependent: :destroy
  has_many :users, through: :messages
  
  validates :topic, presence: true, uniqueness: true

  before_validation :translit

  def translit
  	self.sid = self.topic.downcase.gsub(" ", "_")
  end
end
