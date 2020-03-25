class SourcesController < ApplicationController
  before_action :find_source, only: %i[sync_posts sync_comments]

  def index
    @title = 'Sources'
    @sources = Source.all
  end

  def sync_posts
    unless @source&.sync_posts
      flash[:error] = "Something went wrong"
    end
    redirect_to root_path
  end

  def sync_comments
    redirect_to root_path
  end

  private

  def find_source
    @source = Source.find_by(id: params[:id])
  end
end
