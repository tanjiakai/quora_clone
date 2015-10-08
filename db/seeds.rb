require_relative '../config/database'

User.create(email: 'test@gmail.com', password: 'test')
a = User.first
Question.create(description: 'What is quora?', user: a)