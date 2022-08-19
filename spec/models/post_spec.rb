require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    user = User.new(name: 'Tester', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester from Mexico.', posts_counter: 0)
    user.save
  end
  subject {
    post = Post.new(title:"Rspec test", text: 'rspec test for post model', comments_counter: 1, likes_counter: 0, user_id: 1)
  }

  before { subject.save }

  describe "Tests for Post model validations" do
    it "comments_counter & likes_counter test" do
      expect(subject).to be_valid
    end

    it "most be integer and zero or more" do
      subject.comments_counter = -1
      subject.likes_counter = 'one'
      expect(subject).to_not be_valid
    end

    it "validation for title length" do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'Increases the comments' do
      counter = User.find(1).posts_counter
      subject.update_posts
      expect(User.find(1).posts_counter).to eq(counter + 1)
    end
  end
end
