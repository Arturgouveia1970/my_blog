class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :likes
  has_many :comments

  after_save :update_posts

  def update_posts
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
