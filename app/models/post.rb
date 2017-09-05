class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 3, maximum: 555 }
end
