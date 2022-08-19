require 'rails_helper'

RSpec.describe Post, type: :model do
  
  user = User.create(name: 'Tester', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester from Mexico.', posts_counter: 0)
  post = Post.new(title:"Rspec test", text: 'rspec test for post model', comments_counter: 1, likes_counter: 0, user_id: user.id)

  describe "Tests for Post model validations" do
    it "comments_counter & likes_counter test" do
      expect(post).to be_valid
    end

    it "most be integer and zero or more" do
      post.comments_counter = -1
      post.likes_counter = 'one'
      expect(post).to_not be_valid
    end

    it "validation for title length" do
      post.title = 'a' * 251
      expect(post).to_not be_valid
    end

    it 'Increases the comments' do
      counter = User.find(user.id).posts_counter
      post.update_posts
      expect(User.find(user.id).posts_counter).to eq(counter + 1)
    end
  end
end
