require 'rails_helper'

RSpec.describe "User pages test index/show ", type: :feature do
  before(:all) do
    @user = User.create(name: 'Integration test', photo: 'http://twitter.com', bio: 'test for User')
    @post = Post.create(title: 'Rspec test', text: 'rspec test for post', user: @user)
    @comment = Comment.create(post: @post, user: @user, text: 'This is a test for comment model')
    @like = Like.create(post: @post, user: @user)
  end

  describe 'User index page test' do
    scenario 'Should show the username ' do
      visit users_path
      expect(page).to have_content(@user.name)
    end

    scenario 'Should show the profile picture' do
      visit users_path
      expect(page).to have_selector("img[src='#{@user.photo}']")
    end

    scenario 'Should show the profile picture' do
      @post = Post.create(title: 'Rspec test 2', text: 'rspec test for post', user: @user)
      visit users_path
      expect(page).to have_text("Number of posts: 2")
    end
    
    scenario 'should redirect to user\'s page' do
      @second_user = User.create(name: 'Messi', photo: 'http://google.com', bio: 'test for redirecting')
      visit users_path
      click_on @second_user.name
      expect(page).to have_current_path(user_path(@second_user))
    end
  end

end
