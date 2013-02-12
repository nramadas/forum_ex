class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :title

  validates :author_id, presence: true
  validates :body, length: { in: 1..1024 }
  validates :title, length: { in: 1..64 }

  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User", foreign_key: :author_id

  def comments_for(user)
    self.comments.where("author_id = ?", user.id)
  end

  def self.commented_by(user)
    # self
    #   .select("posts.*, comments.*")
    #   .joins("OUTER JOIN comments ON comments.post_id = posts.id")
    #   .where("comments.author_id = ?", user.id)
  end

end
