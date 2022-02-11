require 'rails_helper'
require 'factory_bot'


describe User do

  before do 
    @user = User.new(name: "Dave", email: "Dave@yahoo.com", 
    password: "foobar", password_confirmation: "foobar")

    # passwords do not match
    @user2 = User.new(name: "Dave", email: "Dave@yahoo.com", 
      password: "foobar", password_confirmation: "fooba12r")

    # missing name 
    @user3 = User.new(name: " ", email: "Dave@yahoo.com", 
      password: "foobar", password_confirmation: "foobar")

    # invalid email address
    @user4 = User.new(name: "Dave", email: "Dave@yahoo,com", 
      password: "foobar", password_confirmation: "foobar")
  end

  it "should be a valid user" do 
    expect(@user).to be_valid
  end

  it "should not be a valid user" do 
    expect(@user2).to_not be_valid 
  end

  it "name should be present" do 
    expect(@user3).to_not be_valid 
  end

  it "email address should have valid format" do 
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
    end
    expect(@user).to be_valid 
  end

  it "invalid email addresses should be rejected" do 
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
    end
    expect(@user).to_not be_valid
  end 

end
