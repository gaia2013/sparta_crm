class Comment < ApplicationRecord
  belongs_to :customer

  validates :body, presence: true
  # validates :customer_id, presence: true
  # rails5以降はデフォルト搭載 
end
