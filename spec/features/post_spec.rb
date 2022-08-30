require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  before(:all) do 
    @user1 = User.create(name: 'Integration test', photo: 'http://twitter.com', bio: 'test for User')
    @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', user: @user1)
    @comment = Comment.create(user: @user1, post: @post1, text: 'test for User')
    @like = Like.create(user: @user1, post: @post1)
  end 
  
  describe 'User post index page' do
    scenario 'Should show the username ' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@user1.name)
    end

    scenario 'Should show the profile picture' do
      visit user_posts_path(@user1)
      expect(page).to have_selector("img[src='#{@user1.photo}']")
    end
    
    scenario 'Should show the Number of posts' do
      visit user_posts_path(@user1)
      expect(page).to have_text("Number of posts: 4")
    end

    scenario 'Should show the post title ' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.title)
    end

    scenario 'Should show the post body ' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post1.text)
    end

    scenario 'Should show the first comment ' do
      visit user_posts_path(@user1)
      expect(page).to have_content('test for User')
    end

    scenario 'Should show the number of comment ' do
      visit user_posts_path(@user1)
      expect(page).to have_content("Comments: '#{@post1.comments_counter}'")
    end

    scenario 'Should show the number of likes ' do
      visit user_posts_path(@user1)
      expect(page).to have_content("Likes: '#{@post1.likes_counter}'")
    end

    scenario 'Should show the pagination ' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Pagination')
    end

    scenario 'Should show redirects me to that post\'s show page. ' do
      visit user_posts_path(@user1)
      click_on @post1.title
      expect(page).to have_current_path(user_post_path(@user1, @post))
    end

  end  
end