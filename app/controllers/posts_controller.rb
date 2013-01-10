# encoding: utf-8
class PostsController < ApplicationController
  def index
    @posts = Post.all
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
end


