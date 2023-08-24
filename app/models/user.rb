class User < ApplicationRecord


  has_secure_password 

  has_one  :user_profile, dependent: :destroy
  has_many :posts,  dependent: :destroy
  has_many :likes, through: :posts
  has_many :comments, through: :posts
  has_many :followers, class_name: "Follow", foreign_key: "followed_id",  dependent: :destroy
  has_many :followeds, class_name: "Follow", foreign_key: "follower_id" ,  dependent: :destroy
  has_many  :following_user_posts, through: :followeds, source: :followed
  
  has_many :images,  as: :imageable,  class_name: "Product"
  
  validates :email, presence: true, uniqueness: true, email: true
  # validates :password, presence: true 

  after_commit :show_confirmation_message

  private 
  def show_confirmation_message
    puts "you have successfully loged in"
  end

  scope :user_post, -> {includes(:posts)}
end
