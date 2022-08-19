require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  user = User.create(name: 'Tester', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester from Mexico.', posts_counter: 0)
  post = Post.create(title:"Rspec test", text: 'rspec test for post model', comments_counter: 1, likes_counter: 0, user_id: 1)
  comment = Comment.new(post_id: post.id, user_id: user.id, text: 'This is a test for comment model')

  describe "Tests for Comment model validations" do
    it "comment should be valid" do
      expect(comment).to be_valid
    end

    it 'Increases the comments_counter' do
      counter = Post.find(post.id).comments_counter
      comment.update_comments
      expect(Post.find(post.id).comments_counter).to eq(counter + 1)
    end
  end
end
