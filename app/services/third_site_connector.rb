class ThirdSiteConnector
  def fetch_all_posts
    ApiEmulator::ThirdSiteApiEmulator.new.fetch_all_posts
  end

  def fetch_post_comments(handle)
    ApiEmulator::ThirdSiteApiEmulator.new.fetch_post_comments(handle)
  end
end