class Book < ApplicationRecord
  validates :user_id, presence:true
  validates :title, presence:true
  validates :body, presence: true, length: {maximum: 200}
  belongs_to :user
end
