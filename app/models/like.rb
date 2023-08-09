class Like < ApplicationRecord
  belongs_to :post, counter_cache: true, dependent: :destroy
  belongs_to :user
end
