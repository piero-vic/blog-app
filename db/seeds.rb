User.create(id: 1, name: 'Qwerty', email: 'qwerty@qwerty.com', bio: "Hello there! I'm Qwerty.",
            photo: 'https://randomuser.me/api/portraits/men/75.jpg',
            password: 'qweqwe123', posts_counter: 0)

User.create(id: 2, name: 'Ytrewq', email: 'ytrewq@ytrewq.com', bio: "Hello there! I'm Ytrewq.",
            photo: 'https://randomuser.me/api/portraits/men/55.jpg',
            password: 'ewqewq321', posts_counter: 0)

Post.create(id: 1, author_id: 1, title: 'Hello 1', text: 'This is my first post', comments_counter: 0,
            likes_counter: 0)

Post.create(id: 2, author_id: 1, title: 'Hello 2', text: 'This is my second post', comments_counter: 0,
            likes_counter: 0)

Post.create(id: 3, author_id: 1, title: 'Hello 3', text: 'This is my third post', comments_counter: 0,
            likes_counter: 0)

Post.create(id: 4, author_id: 1, title: 'Hello 4', text: 'This is my fourth post', comments_counter: 0,
            likes_counter: 0)

Comment.create(author_id: 1, post_id: 2, text: 'This is my first comment')
Like.create(author_id: 1, post_id: 1)
