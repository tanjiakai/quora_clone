get '/questions' do
  @user_id = session[:user].id
  @questions = Question.all
  erb :"questions/home"
end

get '/questions/new' do
  erb :"questions/new"
end

post '/questions' do
  Question.create(description: params[:question], user: session[:user])
  redirect to '/questions'
end

get '/questions/:id' do

end

get '/questions/:id/edit' do

end

put '/questions/:id' do

end

delete '/questions/:id' do

end