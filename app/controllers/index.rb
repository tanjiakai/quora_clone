get '/' do
  if !session[:user].nil?
    @user_id = session[:user].id
    redirect to '/questions'
  end
  @questions = Question.all
  erb :index
end