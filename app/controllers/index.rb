get '/' do
  if !session[:user].nil?
    @user_id = session[:user].id
    redirect to '/questions'
  end
  @not_login = session[:flash]
  @questions = Question.all
  erb :index
end