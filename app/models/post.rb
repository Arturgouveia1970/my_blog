class Post < ApplicationRecord
  belongs_to :user, counter_cache: :postcounter
  has_many :comments, :likes
end
