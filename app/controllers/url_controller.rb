# get '/' do
#   # Look in app/views/index.erb
#   @urls = Url.all
#   erb :index
# end


post '/urls' do
#create short url
  current_user = User.find_by_email(session[:user])
  @urls = Url.all
  @url = Url.new(:long_url => params[:long_url], :user_id => current_user.id)
  if @url.save
   redirect to ('/users')
  else
    # show error message on main page to user
    erb :index
  end
end



# get '/:short_url' do
#   url = Url.find_by_short_url(params[:short_url])
#   url.update_attributes :counter => url.counter + 1
#   redirect to(url.long_url)
#   # http://#{u.long_url}
# end