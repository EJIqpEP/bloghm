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
end
