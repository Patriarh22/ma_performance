class FourthSiteConnector
  def fetch_all_posts
    ApiEmulator::FourthSiteApiEmulator.new.fetch_all_posts
  end

  def fetch_post_comments(handle)
    ApiEmulator::FourthSiteApiEmulator.new.fetch_post_comments(handle)
  end
end