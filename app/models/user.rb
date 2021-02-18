class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts

  acts_as_messageable
  acts_as_favoritor
  acts_as_followable
  acts_as_follower
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def name
    username
  end

  def mailboxer_email(object)
    email
  end
end