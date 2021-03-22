# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  acts_as_messageable
  acts_as_favoritor
  acts_as_followable
  acts_as_follower

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def name
    username
  end

  def mailboxer_email(_object)
    email
  end
end
