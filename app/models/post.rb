class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments
  has_many :likes
  
  validates :content, presence: true, length: { in: 1..100 }
  validates :image, presence: true
end
