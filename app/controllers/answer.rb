get '/answers' do
  erb :"answers/home"
  redirect to "questions/home"
end

get '/answers/new' do
  erb :"answers/new"
end

post '/answers' do
  Answer.create(description: params[:answer], question: session[:question], user: session[:user])
  id = session[:question]
  redirect to "/questions/#{id.id}"
end

get '/answers/:id' do

end

get '/answers/:id/edit' do

end

put '/answers/:id' do

end

delete '/answers/:id' do

end