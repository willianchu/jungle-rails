class User < ActiveRecord::Base

  has_secure_password

  validates :password, length: { minimum: 8 }

  validates_uniqueness_of :email, :case_sensitive => false



  def self.authenticate_with_credentials(email, password)
    
    normalized_email = email.downcase.strip

    user = User.find {|el| el.email.downcase == normalized_email}

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
