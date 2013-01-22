# encoding: utf-8
class AdminController < ApplicationController  
  before_filter :most_recent_posts
  before_filter :authenticate_user!
  def index
    @search = Post.search(params[:search])
    @posts = Post.page(params[:page]).per(10)
    @posts = @search.page(params[:page]).per(10)
  end

  def most_recent_posts
    @most_recent_posts ||= Post.published.limit(5)
  end

end

