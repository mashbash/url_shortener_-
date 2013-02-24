class User < ActiveRecord::Base

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => { :with => /\S+[@]\S+[.]\w{2,3}/,
                                 :message => "needs a valid format dude!"}
  validates :password, :presence => true

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


