require 'spec_helper'

describe 'User Access' do
  describe PostsController do
    include Devise::TestHelpers

    #it 'should allow registered user to create post' do
      #user = FactoryGirl.create(:user)
      #sign_in user
      #expect {
        #article_params = FactoryGirl.attributes_for(:post)
        #pp article_params
        #post :create, :article => article_params
      #}.to_not change(Post, :count)
      #response.should redirect_to(new_user_session_path)
      #flash[:alert].should == "You need to sign in or sign up before continuing."

    #end
  end
end
