class User < ActiveRecord::Base
  attr_accessible :name, :last_viewed_user_page
  validates :name, :length => { in: 4..16 }, uniqueness: true
  
  # one thing I like to do (that you might like as well) is use
  # validates_uniqueness_of and
  # validates_length_of to do my validations. It may be more
  # lines of code, but it is more explicit

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :commented_posts, class_name: "Post",
            through: :comments, source: :post

  def add_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
    self.save!
  end

end
