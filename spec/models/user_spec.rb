require 'rails_helper'

describe User do

  it "should be a valid user" do 
    user = User.new( name: "Dave", email: "Dave@yahoo.com", 
                    password: "foobar", password_confirmation: "foobar")
    expect(user).to be_valid
  end

  it "should not be a valid user" do 
    user = User.new( name: "Dave", email: "Dave@yahoo.com", 
      password: "foobar", password_confirmation: "fooba12r")
    expect(user).to_not be_valid 
  end


end
