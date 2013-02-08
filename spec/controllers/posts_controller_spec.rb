require 'spec_helper'

describe 'Guest Access' do
  describe PostsController do
    include Devise::TestHelpers

    describe 'INDEX' do
      it do
        get :index
        assert_template 'posts/index'
      end
    end

    describe "CREATE post" do
      it 'should not allow guest to create post' do
        expect {
          article_params = FactoryGirl.attributes_for(:post)
          post :create, :article => article_params
        }.to_not change(Post, :count)
        response.should redirect_to(new_user_session_path)
        flash[:alert].should == "You need to sign in or sign up before continuing."
      end

      #it 'should allow registered user to create post' do
        #@user = FactoryGirl.create(:user)
        #sign_in :user, @user
        #expect {
          #article_params = FactoryGirl.attributes_for(:post)
          #pp article_params
          #post :create, :article => article_params
        #}.to change(Post, :count).from(0).to(1)
        #response.should redirect_to(new_user_session_path)
        #flash[:alert].should == "You need to sign in or sign up before continuing."
      #end
    end

    describe 'DELETE post' do
      before do
        @post = FactoryGirl.create(:post)
      end
      it 'should not allow guest to delete post' do
        expect {
          delete :destroy, id: @post.id
        }.to_not change(Post, :count)
        response.should redirect_to(new_user_session_path)
        flash[:alert].should == "You need to sign in or sign up before continuing."
      end

      it 'should allow registered user to delete post' do
        @user = FactoryGirl.create(:user)
        sign_in :user, @user
        expect {
          delete :destroy, id: @post.id
        }.to change(Post, :count).from(1).to(0)
        response.should redirect_to(root_path)
        flash[:notice].should == "Post was deleted"
      end

    end

    describe 'UPDATE post' do
      before do
        @post = FactoryGirl.create(:post)
      end
      it 'should not allow guest to update post' do
        put :update, id: @post, post: { title: "new title" }
        response.should redirect_to(new_user_session_path)
        flash[:alert].should == "You need to sign in or sign up before continuing."
      end
      it 'should allow registered user to update post' do
        @user = FactoryGirl.create(:user)
        sign_in :user, @user
        put :update, id: @post, post: { body: "new body" }
        response.should redirect_to(edit_post_path(@post))
        flash[:notice].should == "Post was successfully updated."        
      end
    end
  end
end
