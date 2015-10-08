get '/sessions/new' do
  erb :"users/sessions"
end

post '/sessions' do
  if User.exist?(params[:email])
    if User.authenticate?(params[:email], params[:password])
      session[:user] = User.find_by(email: params[:email])
      # redirect to "/users/#{session[:user_id]}"
      redirect to '/questions'
    else
      @error = 'Invalid password'
    end
  else
    @error = "User doesn't exist"
  end
  erb :errors
end

delete '/sessions' do
  session[:user_id] = nil
  redirect to '/'
end

get '/users/new' do
  erb :"users/users"
end

post '/users' do
  @user = User.create(email: params[:email], password: params[:password])
  p "[LOG] @user = #{@user.errors.messages}"
  if @user.errors.any?
    erb :"users/errors"
  else
    redirect to "users/profiles"
  end

end

get '/users/:id' do
  current_user
 erb :"users/profiles"
end

post '/users/:id' do

end

get '/users/:id/questions' do
  @questions = Question.where(user: session[:user])
  erb :'users/questions'
end
