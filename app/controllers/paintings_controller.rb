class PaintingsController < ApplicationController

  def create
    @post = Post.find_by_slug(params[:post_id])
    @painting = @post.paintings.create(params[:painting])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @painting = @post.paintings.find(params[:id])
    if @painting.destroy
      respond_to do |format|
        format.js
      end
    end
  end
end
