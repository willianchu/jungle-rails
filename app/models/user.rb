class User < ActiveRecord::Base

  has_secure_password

  before_save { self.email = email.downcase }

  validates :password, length: { minimum: 8 }

  validates_uniqueness_of :email, :case_sensitive => false



  def self.authenticate_with_credentials(email, password)
    
    normalized_email = email.downcase.strip

    puts "USER MODULE>>>"
    puts normalized_email

    user = User.find_by_email(normalized_email)

    puts "FIND USER>>>"
    puts user.inspect

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
