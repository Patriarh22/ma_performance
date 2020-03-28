class ApplicationController < ActionController::Base
  private

  def redirect_to_root_path(success)
    unless success
      flash[:error] = "Something went wrong"
    end
    redirect_to root_path
  end
end
