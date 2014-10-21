class User < ActiveRecord::Base
  has_many :upvotes
  has_many :tracks, through: :upvotes
end

