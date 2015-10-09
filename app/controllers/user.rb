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
  erb :'users/errors'
end

delete '/sessions' do
  session[:user] = nil
  redirect to '/'
end

get '/users/new' do
  erb :'users/new_user'
end

post '/users' do
  if params[:password] == params[:password2]
    @user = User.create(email: params[:email], password: params[:password])
    p "[LOG] @user = #{@user.errors.messages}"
    if @user.errors.any?
      erb :"users/errors"
    else
      session[:user] = User.find_by(email: params[:email])
      redirect to '/questions'
    end
  end
end

get '/users/questions' do
  unless session[:user].nil?
    id = session[:user].id
    redirect to "/users/#{id}/questions"
  else
    session[:flash] = 'Please login to continue.'
    redirect to '/'
  end
end

get '/users/answers' do
  unless session[:user].nil?
    id = session[:user].id
    redirect to "/users/#{id}/answers"
  else
    session[:flash] = 'Please login to continue.'
    redirect to '/'
  end
end

post '/users/:id' do

end

get '/users/:id/questions' do
  unless session[:user].nil?
    @questions = Question.where(user: session[:user])
    erb :'users/questions'
  else
    redirect to '/users/login_required'
  end
end

get '/users/:id/answers' do
  unless session[:user].nil?
    @answers = Answer.where(user: session[:user])
    erb :'users/answers'
  else
    redirect to '/users/login_required'
  end
end

get '/users/login_required' do
  erb :'users/notlogin'
end