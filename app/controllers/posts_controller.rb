class PostsController < ApplicationController
  before_action :find_post

  def show
    redirect_to_root_path(false) unless @post
  end

  def sync_comments
    if @post
      @post.sync_comments
      redirect_to source_post_path(@post.source_id, @post)
    else
      redirect_to_root_path(false)
    end
  end

  private

  def find_post
    @post = Post.find_by(id: params[:id], source_id: params[:source_id])
  end
end
