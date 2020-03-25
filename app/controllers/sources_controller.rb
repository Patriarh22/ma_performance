class SourcesController < ApplicationController
  def index
    @title = 'Sources'
    @sources = Source.all
  end

  def sync_posts
    redirect_to root_path
  end

  def sync_comments
    redirect_to root_path
  end
end
