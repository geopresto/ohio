require 'rails_helper'
require 'factory_bot'

describe User do

  it "should be a valid user" do 
    user = User.new(name: "Dave", email: "Dave@yahoo.com", 
                      password: "foobar", password_confirmation: "foobar")
    expect(user).to be_valid
  end

  it "should not be a valid user" do 
    user = User.new(name: "Dave", email: "Dave@yahoo.com", 
                    password: "foobar", password_confirmation: "fooba12r")
    expect(user).to_not be_valid 
  end

  it "name should be present" do 
    user = User.new(name: " ", email: "Dave@yahoo.com", 
                   password: "foobar", password_confirmation: "foobar")
    expect(user).to_not be_valid 
  end

  it "email address should have valid format" do 
    user = User.new(email: "Dave@yahoo.com")
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
    end
    expect(user).to be_valid 
  end

  it "invalid email addresses should be rejected" do 
    user = User.new(email: "Dave@yahoo,com")
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
    end
    expect(user).to_not be_valid
  end 




end
