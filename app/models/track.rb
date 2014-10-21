class Track < ActiveRecord::Base
  has_many :upvotes
  has_many :users, through: :upvotes
  validates :songtitle, :url, :author, presence: true
end
