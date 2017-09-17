class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.current
    RequestStore.store[:current_user] ||= nil
  end

  def self.current=(user)
    RequestStore.store[:current_user] = user
  end


end
