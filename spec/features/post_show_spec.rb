require 'rails_helper'
RSpec.describe 'Posts', type: :feature do
  before do
    @user1 = User.create(name: 'Patrick Mboma', photo: 'http://twitter.com', bio: 'test for User')
    @user2 = User.create(name: 'Paul Biya', photo: 'http://twitter.com', bio: 'test for User')
    @post1 = Post.create(user: @user1, title: 'Rspec test 1', text: 'rspec test for post')
    @comment1 = Comment.create(user: @user1, post: @post1, text: 'test for User')
    @comment2 = Comment.last
    @like = Like.create(user: @user1, post: @post1)
  end

  describe 'User post show page' do
    it 'Should show the post title ' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content(@post1.title)
    end

    it 'Should show the username ' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content(@user1.name)
    end

    it 'Should show the number of comment ' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content("Comments: #{@post1.comments.count}")
    end

    it 'Should show the number of likes ' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content("Likes: #{@post1.likes.count}")
    end

    it 'Should show the post body ' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content(@post1.text)
    end

    it 'Should show the post commentor name ' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content(@comment1.user.name)
    end
  end
end
