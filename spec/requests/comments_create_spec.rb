require 'spec_helper'

describe "Sending Comments" do
  before(:each) do
    @post = FactoryGirl.create(:post)
  end
  it "should allow user to post new comment" do
    pp @post
    #visit post_path(@post)
    visit "/posts/deploying-through-sshii"
    current_path.should == "shs"
    page.should have_content('ssh')
    fill_in 'comment[name]', :with => "name"
    fill_in 'comment_email', :with => "email@mail.com"
    fill_in 'comment_content', :with => "content"
  end
end
