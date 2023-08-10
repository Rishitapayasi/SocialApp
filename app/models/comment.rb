class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies, class_name: "Comment", foreign_key: "comment_id"
  belongs_to :reply_on, class_name: "Comment", foreign_key: "comment_id", optional: true
  

  validates :comment, presence: true, length: { in: 1..100}
end
