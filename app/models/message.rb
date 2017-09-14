class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  def created_at_in_current_time_zone_short
    I18n.l(self.created_at.in_time_zone(Time.zone), format: :short)
  end
end
