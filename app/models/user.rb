class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :messages
  has_many :rooms, through: :messages
end
