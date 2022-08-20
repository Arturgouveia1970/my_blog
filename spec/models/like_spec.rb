require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tester', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester from Mexico.',
                     posts_counter: 0)
  post = Post.create(title: 'Rspec test', text: 'rspec test for post model', comments_counter: 1, likes_counter: 0,
                     user_id: 1)
  like = Like.new(post_id: post.id, user_id: user.id)

  describe 'Tests for Like model validations' do
    it 'like should be valid' do
      expect(like).to be_valid
    end

    it 'Increases the likes_counter' do
      counter = Post.find(post.id).likes_counter
      like.update_likes
      expect(Post.find(post.id).likes_counter).to eq(counter + 1)
    end
  end
end
