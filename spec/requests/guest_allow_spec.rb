require 'spec_helper'

describe "Unregistered allow" do

  it "should not allow an unregistered user to login admin" do
    visit admin_index_path
    current_path.should == new_user_session_path
  end

  it "should not allow an unregistered user to login admin/comments" do
    visit comments_admin_index_path
    current_path.should == new_user_session_path
  end

  it "should not allow an unregistered user to visit edit post" do
    @post = FactoryGirl.create(:post)
    visit edit_post_path(@post)
    current_path.should == new_user_session_path
  end

  it "should not allow an unregistered user to visit edit page" do
    @page = FactoryGirl.create(:page)
    visit edit_page_path(@page)
    current_path.should == new_user_session_path
  end

  it "should not allow an unregistereg user to visit edit comment" do
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.create(:comment)
    visit edit_post_comment_path(@post, @comment)
    current_path.should == new_user_session_path
  end
end
