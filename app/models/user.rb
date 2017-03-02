class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates_presence_of :email
  validates_length_of :password, :minimum => 6, :on => :create
  validates_uniqueness_of :email, :case_sensitive => false

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password

  has_many :messages
  has_many :rooms, through: :messages
end
