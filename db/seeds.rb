# Users
first_user = User.create(name: 'Tom', photo: 'https://randomuser.me/api/portraits/men/75.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)
second_user = User.create(name: 'Lilly', photo: 'https://randomuser.me/api/portraits/women/75.jpg', bio: 'Teacher from Poland.', posts_counter: 0)

# Posts
first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: first_user.id, title: 'Hello 2', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author_id: first_user.id, title: 'Hello 3', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author_id: first_user.id, title: 'Hello 4', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)

# Comments
first_comment = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Tom!' )
second_comment = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hello Tom!' )
third_comment = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Nice Post Tom!' )
fourth_comment = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hola Tom!' )
fifth_comment = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Ciao Tom!' )
sixth_comment = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hallo Tom!' )
