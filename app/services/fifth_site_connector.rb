class FifthSiteConnector
  def fetch_all_posts
    ApiEmulator::FifthSiteApiEmulator.new.fetch_all_posts
  end

  def fetch_post_comments(handle)
    ApiEmulator::FifthSiteApiEmulator.new.fetch_post_comments(handle)
  end
end