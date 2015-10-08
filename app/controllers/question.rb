get '/question' do
  @questions = Question.all
  erb :"questions/home"
end

get '/question/new' do
  erb :"questions/new"
end

post '/question' do
  Question.create(description: params[:question], user: session[:user])
  redirect to '/question'
end

get '/question/:id' do

end

get '/question/:id/edit' do

end

put '/question/:id' do

end

delete '/question/:id' do

end