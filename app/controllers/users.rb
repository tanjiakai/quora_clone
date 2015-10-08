get '/session/new' do
  erb :"users/sessions"
end

post '/session' do
  if User.exist?(params[:email])
    if User.authenticate?(params[:email], params[:password])
      session[:user_id] = User.find_by(email: params[:email]).id
      redirect to "/users/#{session[:user_id]}"
    else
      @error = 'Invalid password'
    end
  else
    @error = "User doesn't exist"
  end
  erb :errors
end

delete '/session' do
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
