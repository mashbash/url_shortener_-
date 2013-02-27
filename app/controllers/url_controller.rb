post '/urls' do
  current_user = User.find_by_email(session[:user])
  puts current_user
  puts current_user.id

  @url = Url.create(:long_url => params[:long_url],
                    :user_id => current_user.id)
  if request.xhr?
    content_type :json
    { :long_url => @url.long_url, :user_id => @url.user_id, :short_url => @url.short_url, :counter => @url.counter}.to_json
    #halt 404
  else
    if @url.save
     redirect to ('/users')
    else
      if session[:user] 
        @user = User.find_by_email(session[:user] )
        urls = Url.where(:user_id => @user.id) 
        @urls = urls.sort! { |a,b| b.id <=> a.id } # To make sure they stay in the same order!
        erb :users 
      else 
        redirect('/')
      end 
    end
  end
end


get '/url/:short_url' do
  url = Url.find_by_short_url(params[:short_url])
  url.counter += 1
  url.save
  redirect to(url.long_url)
end
