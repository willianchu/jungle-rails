require 'rails_helper'


RSpec.describe User, type: :model do
  
  it "is valid with password matching" do
    user_with_password = User.create(name: "Jeff Besos", email: "besos@amazon.com", password: "password", password_confirmation: "password")
    expect(user_with_password).to be_valid  
  end
  
  it "is NOT valid with different password" do
    user_without_password_match = User.create(name: "Bill Gates", email: "billgates@microsoft.com", password: "windows11", password_confirmation: "office360")
    expect(user_without_password_match).to be_invalid  
  end

  it "is not permit same email case sensitive" do
    user_with_password = User.create(name: "Queen Elizabeth", email: "elizabeth@queen.com", password: "password", password_confirmation: "password")
    user_duplicate_email = User.create(name: "Quim Elizabeth", email: "ELIZABETH@QUEEN.COM", password: "password", password_confirmation: "password")
    expect(user_duplicate_email).to be_invalid 
  end

  it "is not permit password with less 8 digit" do
    user_tiny_password = User.create(name: "Eloine Muskyevitch", email: "eloine@tesla.com", password: "pass", password_confirmation: "pass")
    expect(user_tiny_password).to be_invalid 
  end

  describe '.authenticate_with_credentials' do
    it "will authenticate a regular user in database" do
    user_auth = User.create(name: "Paris Hilton", email: "paris@hilton.com", password: "parishilton", password_confirmation: "parishilton")
    expect(User.authenticate_with_credentials(user_auth.email, user_auth.password)).to eq(user_auth)
    end

    it "will NOT authenticate an unknown user" do
      unknown_user = User.authenticate_with_credentials("fake@email.com", "something")
      expect(unknown_user).to eq(nil)
    end
    
  end

  describe 'edge cases' do
    it "will authenticate user with blank spaces before and after a valid email and password" do
    user_auth = User.create(name: "Sleepy Person", email: "zzz@spleep.com", password: "zzzz1234", password_confirmation: "zzzz1234")
    expect(User.authenticate_with_credentials("  zzz@spleep.com  ", user_auth.password)).to eq(user_auth)
    end

    it "will authenticate user with uppercase and lower case email" do
      user_camel = User.create(name: "CaMeL PeRSoN", email: "eXample@domain.COM", password: "camel1234", password_confirmation: "camel1234")
      puts "RESPECT >>>"
      puts user_camel.email.strip.downcase
      puts user_camel.email
      expect(User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", user_camel.password)).to eq(user_camel)
      end
  end




end