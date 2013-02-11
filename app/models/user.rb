class User < ActiveRecord::Base
  attr_accessible :name
  validates :name, :length => { in: 4..16 }, uniqueness: true

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  before_save :add_remember_token


  private

  def add_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end