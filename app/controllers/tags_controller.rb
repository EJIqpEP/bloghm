class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_slug(params[:id])
    @posts = @tag.posts.page(params[:page]).per(10)
    @most_recent_posts ||= Post.limit(5)
  end

end
