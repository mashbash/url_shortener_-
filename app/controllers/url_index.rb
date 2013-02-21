get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end


post '/urls' do
#create short url
  @urls = Url.all
  @url = Url.new params 
  if @url.save
   redirect to ('/')
  else
    # show error message on main page to user
    erb :index
  end
end

get '/:short_url' do
  url = Url.find_by_short_url(params[:short_url])
  url.update_attributes :counter => url.counter + 1
  redirect to(url.long_url)
  # http://#{u.long_url}
end
