class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
end
