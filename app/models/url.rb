require 'securerandom'

class Url < ActiveRecord::Base

  validates :long_url, :format => { :with => /^(http)s?:\/\/.+(.)\w{2,}/, 
  :message => "URLs must include protocol, host, and path (e.g. -- http://www.google.com)"}

  before_save :create_short_url

  def create_short_url
    self.short_url = SecureRandom.hex(4)
  end

  belongs_to :user

end
