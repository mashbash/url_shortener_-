enable :sessions





get '/' do
  if session[:user]   # Weren't able to get it to work with a before filter but do we even need them?
    redirect('users')
  else
    erb :index
  end
end

get '/users' do
  if session[:user] 
    @user = User.find_by_email(session[:user] )
    erb :users 
  else 
    redirect('/')
  end 
end

get '/hacker' do
  erb :hacker
end

post '/logout' do
  session.clear
  redirect('/')
end

post '/login' do
  if User.authenticate params[:email], params[:password]
    session[:user] = params[:email]
    redirect to ('/users')
  else
    redirect to ('/hacker')
  end
end

post '/new' do
  @user = User.new params
  @user.save
  redirect to ('/')
end
