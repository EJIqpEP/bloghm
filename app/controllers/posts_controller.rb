# encoding: utf-8
class PostsController < ApplicationController
  before_filter :most_recent_posts
  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
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
    redirect_to posts_path, :notice => "Post was deleted"
  end

  def most_recent_posts
    @most_recent_posts ||= Post.limit(5)
  end
end


