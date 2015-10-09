require_relative '../config/database'

User.create(email: 'test@gmail.com', password: 'test')
User.create(email: 'test2@gmail.com', password: 'test')
User.create(email: 'test3@gmail.com', password: 'test')

a = User.first
b = User.first
c = User.first
Question.create(description: 'Question 1', user: a)
Question.create(description: 'Question 2', user: a)
Question.create(description: 'Question 3', user: b)
Question.create(description: 'Question 4', user: b)
Question.create(description: 'Question 5', user: c)
Question.create(description: 'Question 6', user: c)