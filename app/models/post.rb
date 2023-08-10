class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy  
  
  validates :content, presence: true, length: { in: 1..100 }
  validates :image, presence: true
end
