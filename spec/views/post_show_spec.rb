require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  before do
    User.create(id: 1, name: 'Qwerty', email: 'qwerty@qwerty.com', bio: "Hello there! I'm Qwerty.",
                photo: 'https://randomuser.me/api/portraits/men/75.jpg',
                password: 'qweqwe123', posts_counter: 0)

    User.create(id: 2, name: 'Ytrewq', email: 'ytrewq@ytrewq.com', bio: "Hello there! I'm Ytrewq.",
                photo: 'https://randomuser.me/api/portraits/men/55.jpg',
                password: 'ewqewq321', posts_counter: 0)

    Post.create(id: 1, author_id: 1, title: 'Hello 1', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)

    Comment.create(author_id: 2, post_id: 1, text: 'This is my first comment')

    Like.create(author_id: 1, post_id: 1)
    Like.create(author_id: 2, post_id: 1)
  end

  describe 'Visiting the post show page' do
    before :each do
      visit '/users/1/posts/1'
    end

    it 'should display the title of the post' do
      expect(page).to have_text('Hello 1')
    end

    it 'should display the name of the author' do
      expect(page).to have_text('Qwerty')
    end

    it 'should display the body of the posts' do
      expect(page).to have_text('This is my first post')
    end

    it 'should display how many comments the post has' do
      expect(page).to have_text('Comments: 1')
    end

    it 'should display how many comments the post has' do
      expect(page).to have_text('Likes: 2')
    end

    it 'should display comments' do
      expect(page).to have_text('This is my first comment')
    end

    it 'should display the name onf the commentor' do
      expect(page).to have_text('Ytrewq')
    end
  end
end
