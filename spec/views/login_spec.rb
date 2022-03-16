require 'rails_helper'

RSpec.describe 'Login page', type: :system do
  before do
    User.create(id: 1, name: 'Qwerty', email: 'qwerty@qwerty.com',
                photo: 'https://randomuser.me/api/portraits/men/75.jpg',
                password: 'qweqwe123', posts_counter: 0)
  end

  describe 'Visiting the login page' do
    before :each do
      visit '/users/sign_in'
    end

    it 'should have email input field' do
      expect(page).to have_text('Email')
    end

    it 'should have password inpuput field' do
      expect(page).to have_text('Password')
    end

    it 'should have a log in button' do
      expect(page).to have_button('Log in')
    end

    it "should display a error message if user doesn't fill in the username or password" do
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should display a error message if user fills in username or password with incorrect data' do
      fill_in 'Email', with: 'ytrewq@ytrewq.com'
      fill_in 'Password', with: 'ewqewq321'
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should redirect to root page if data is corrent' do
      fill_in 'Email', with: 'qwerty@qwerty.com'
      fill_in 'Password', with: 'qweqwe123'
      click_button 'Log in'
      expect(page).to have_current_path('/')
      expect(page).to have_text('Signed in successfully.')
    end
  end
end
