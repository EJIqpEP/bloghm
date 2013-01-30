require 'spec_helper'

describe "UserSignIns" do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it "should allow a registered user to sign in" do
    visit login_path
    fill_in 'user_email', :with => @user.email
    fill_in 'user_password', :with => @user.password
    click_button "Sign in"
    page.should have_content "Signed in successfully"
  end


  it "should not allow an unregistered user to sign in" do
    visit login_path
    fill_in "Email", :with => "notarealuser@example.com"
    fill_in "Password", :with => "fakepassword"
    click_button "Sign in"
    page.should have_content "Invalid email or password"
  end
  
end
