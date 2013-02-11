class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :title

  validates :author_id, presence: true
  validates :body, length: { in: 1..1024 }
  validates :title, length: { in: 1..64 }

  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User", foreign_key: :author_id



end
