require 'rails_helper'

RSpec.describe 'Login page', type: :system do
  before do
    User.create(id: 1, name: 'Qwerty', email: 'qwerty@qwerty.com',
                photo: 'https://randomuser.me/api/portraits/men/75.jpg',
                password: 'qweqwe123', posts_counter: 0)

    User.create(id: 2, name: 'Ytrewq', email: 'ytrewq@ytrewq.com',
                photo: 'https://randomuser.me/api/portraits/men/55.jpg',
                password: 'ewqewq321', posts_counter: 1)
  end

  describe 'Visiting the users index page' do
    before :each do
      visit '/users'
    end

    it 'should display the username of all users' do
      expect(page).to have_text('Qwerty')
      expect(page).to have_text('Ytrewq')
    end

    it 'should display the profile picture of all users' do
      expect(page).to have_css('img')
    end

    it 'should display the number of posts of all users' do
      expect(page).to have_text('Number of posts: 0')
      expect(page).to have_text('Number of posts: 1')
    end

    it 'should redirect to users page when clicking a user' do
      click_link('Ytrewq')
      expect(page).to have_current_path('/users/2')
    end
  end
end
