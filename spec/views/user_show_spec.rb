require 'rails_helper'

RSpec.describe 'User show page', type: :system do
  before do
    User.create(id: 1, name: 'Qwerty', email: 'qwerty@qwerty.com', bio: "Hello there! I'm Qwerty.",
                photo: 'https://randomuser.me/api/portraits/men/75.jpg',
                password: 'qweqwe123', posts_counter: 0)

    Post.create(id: 1, author_id: 1, title: 'Hello 1', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)

    Post.create(id: 2, author_id: 1, title: 'Hello 2', text: 'This is my second post', comments_counter: 0,
                likes_counter: 0)

    Post.create(id: 3, author_id: 1, title: 'Hello 3', text: 'This is my third post', comments_counter: 0,
                likes_counter: 0)

    Post.create(id: 4, author_id: 1, title: 'Hello 4', text: 'This is my fourth post', comments_counter: 0,
                likes_counter: 0)
  end

  describe 'Visiting the users show page' do
    before :each do
      visit '/users/1'
    end

    it "should display the user's username" do
      expect(page).to have_text('Qwerty')
    end

    it "should display the user's profile picture" do
      expect(page).to have_css('img')
    end

    it "should display the user's bio" do
      expect(page).to have_text('Bio')
    end

    it 'should display the number of posts the user has written' do
      expect(page).to have_text('Number of posts: 4')
    end

    it "should display the user's recent posts" do
      expect(page).to have_text('Hello 2')
      expect(page).to have_text('Hello 3')
      expect(page).to have_text('Hello 4')
    end

    it "should display a button to see all of the user's posts" do
      expect(page).to have_text('See All Posts')
    end

    it 'should redirect to the posts page when clicking a post' do
      click_link('Hello 2')
      expect(page).to have_current_path('/users/1/posts/2')
    end

    it "should redirect to the user's posts page when clicking See All Posts" do
      click_link('See All Posts')
      expect(page).to have_current_path('/users/1/posts')
    end
  end
end
