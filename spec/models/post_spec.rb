require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    User.create(id: 1, name: 'Test', email: 'test@example.com', password: 'password123',
                password_confirmation: 'password123', posts_counter: 0)
  end

  subject do
    Post.new(author_id: 1, title: 'Hello 1', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'should have title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be longer than 250 characters' do
    subject.title = 'This is a test ' * 25
    expect(subject).to_not be_valid
  end

  it 'should have text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'should have comments_counter' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 1.1
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should have likes_counter' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = 1.1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should update the user posts_counter when created' do
    expect(User.take.posts_counter).to eq 1
  end

  describe '#recent_comments' do
    it 'should return 5 comments' do
      Comment.create(post_id: subject.id, author_id: 1, text: 'Test comment 1')
      Comment.create(post_id: subject.id, author_id: 1, text: 'Test comment 2')
      Comment.create(post_id: subject.id, author_id: 1, text: 'Test comment 3')
      Comment.create(post_id: subject.id, author_id: 1, text: 'Test comment 4')
      Comment.create(post_id: subject.id, author_id: 1, text: 'Test comment 5')
      Comment.create(post_id: subject.id, author_id: 1, text: 'Test comment 6')
      expect(subject.recent_comments.length).to eq 5
    end
  end
end
