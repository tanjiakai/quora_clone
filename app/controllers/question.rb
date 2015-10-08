get '/question' do
  @questions = Question.all
  erb :"questions/home"
end

get '/question/new' do

end

post '/question' do

end

get '/question/:id' do

end

get '/question/:id/edit' do

end

put '/question/:id' do

end

delete '/question/:id' do

end