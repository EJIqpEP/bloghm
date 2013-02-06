class TagsController < ApplicationController

  before_filter :tag_cloud, :only => [:index, :show]
  def show
    @tag = Tag.find_by_slug(params[:id])
    @posts = @tag.posts.published.page(params[:page]).per(10)
    @most_recent_posts ||= Post.published.limit(5)
    @search = Post.published.search(params[:search])
  end

  private

end
