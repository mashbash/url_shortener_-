class User < ActiveRecord::Base

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true,
                    :uniqueness => true,
                    :format => { :with => /\S+[@]\S+[.]\w{2,3}/,
                                 :message => "needs a valid format dude!"}
  validates :password, :presence => true

  has_many :urls

  before_save :hash_password

  def hash_password
    self.password = Digest::MD5.hexdigest(self.password)
  end

end
