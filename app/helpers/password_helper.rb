helpers do 

# Maybe not a good usecase for helpers. When shoudl one user helpers and how
# should one name the files?


  def authenticate(email, password)
    hashed_password = Digest::MD5.hexdigest(password)
    user = User.find_by_email(email)
    if user == nil
      false
    elsif user.password == hashed_password
      true
    else
      false
    end
  end 
end
