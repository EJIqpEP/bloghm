class PaintingsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @painting = @post.paintings.build(params[:painting])
    if @painting.save
      respond_to do |format|
        format.js
      end
    end
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
