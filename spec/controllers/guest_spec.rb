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
    end
  end
end
