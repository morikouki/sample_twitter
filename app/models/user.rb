class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_many :follower_relationship, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :follower_user, through: :follower_relationship, source: :followed

  has_many :followed_relationship, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followed_user, through: :followed_relationship, source: :follower

  def follow(user_id)
  	follower_relationship.create(followed_id: user_id)
  end

  def unfollow(user_id)
  	follower_relationship.find_by(followed_id: user_id).destroy
  end

  def following?(user)
  	follower_user.include?(user)
  end
end
