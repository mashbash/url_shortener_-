enable :sessions

before do
  @message = {}
end

after do
  @message.delete :notice
end

get '/' do
  if session[:user]
    redirect('users')
  else
    erb :index
  end
end

get '/users' do
  params.to_json
  if session[:user]   
    @user = User.find_by_email(session[:user] )
    @urls = Url.where(:user_id => @user.id).order('id desc').all
    #@urls = urls.sort! { |a,b| b.id <=> a.id } # To make sure they stay in the same order!
    erb :users 
  else 
    redirect('/')
  end 
end

get '/logout' do
  session.clear
  redirect('/')
end

post '/login' do
  if authenticate params[:email], params[:password]
    session[:user] = params[:email]
    redirect to ('/users')
  else
    redirect to ('/')
  end
end

post '/new' do
  @user = User.new params
  if @user.save
    session[:user] = params[:email]
    redirect to ('/users')
  else
    erb :index
  end
end

# <% if @message[:notice] %>
#         <%= @message[:notice] %>
#       <% end %>


