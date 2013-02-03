# encoding: utf-8
class PostsController < ApplicationController
  before_filter :most_recent_posts
  before_filter :published, :only => [:show]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :tag_cloud, :only => [:index, :show]
  def index
    @search = Post.published.search(params[:search])
    @posts = Post.published.page(params[:page]).per(10)
    @posts = @search.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def show
    @search = Post.search(params[:search])
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
        redirect_to edit_post_path(@post.slug), notice: 'Post was successfully created.'
    else
        render action: "new"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
        redirect_to edit_post_path(@post.slug), notice: 'Post was successfully updated.'
    else
        render action: "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, :notice => "Post was deleted"
  end

  def most_recent_posts
    @most_recent_posts ||= Post.published.limit(5)
  end

  private

    def published
      post = Post.find(params[:id])
      redirect_to(root_path) unless (post.published == true and post.published_at <= Time.zone.now) or (signed_in?)
    end
end


