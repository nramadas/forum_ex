class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id

  validates :body, length: { in: 1..1024 }
  validates :author_id, presence: true
  validates :post_id, presence: true

  belongs_to :post
  belongs_to :author, class_name: "User", foreign_key: :author_id

end