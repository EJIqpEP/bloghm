require 'spec_helper'

describe "Sending Comments" do
  before(:each) do
    @post = FactoryGirl.create(:post)
    @user = FactoryGirl.create(:user)
  end
  it "should allow user to post new comment", :js => true do
    visit post_path(@post)
    current_path.should == "/posts/" + @post.slug
    page.should have_content('ssh')
    fill_in 'comment[name]', :with => "name"
    fill_in 'comment_email', :with => "email@mail.com"
    fill_in 'comment_content', :with => "my wow comment"
    click_button "submit-comment"
    current_path.should == "/posts/" + @post.slug
    page.should have_content "my wow comment" 
  end
end
