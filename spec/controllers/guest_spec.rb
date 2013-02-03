require 'spec_helper'

describe 'Guest Access' do
  describe PostsController do
    include Devise::TestHelpers
    it 'should not allow guest to create post' do
      expect {
        article_params = FactoryGirl.attributes_for(:post)
        post :create, :article => article_params
      }.to_not change(Post, :count)
      response.should redirect_to(new_user_session_path)
      flash[:alert].should == "You need to sign in or sign up before continuing."
    end

    it 'should allow registered user to create post' do
      user = FactoryGirl.create(:user)
      sign_in user
      expect {
        article_params = FactoryGirl.attributes_for(:post)
        post :create, :article => article_params
      }.to_not change(Post, :count)
      response.should redirect_to(new_user_session_path)
      flash[:alert].should == "You need to sign in or sign up before continuing."

    end
  end
end
