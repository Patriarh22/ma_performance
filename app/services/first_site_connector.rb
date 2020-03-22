class FirstSiteConnector
  def fetch_all_posts
    ApiEmulator::FirstSiteApiEmulator.new.fetch_all_posts
  end

  def fetch_post_comments(handle)
    ApiEmulator::FirstSiteApiEmulator.new.fetch_post_comments(handle)
  end
end