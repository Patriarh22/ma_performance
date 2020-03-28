class SourcesController < ApplicationController
  before_action :find_source, only: %i[sync_posts sync_comments]

  def index
    @title = 'Sources'
    @sources = Source.all
  end

  def sync_posts
    redirect_to_root_path(@source&.sync_posts)
  end

  def sync_comments
    redirect_to_root_path(@source&.sync_comments)
  end

  private

  def find_source
    @source = Source.find_by(id: params[:id])
  end
end
