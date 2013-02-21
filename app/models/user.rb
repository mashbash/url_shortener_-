class User < ActiveRecord::Base

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user == nil
      false
    elsif user.password == password
      true
    else
      false
    end
  end

  has_many :urls

end
