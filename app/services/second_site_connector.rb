class SecondSiteConnector
  def fetch_all_posts
    ApiEmulator::SecondSiteApiEmulator.new.fetch_all_posts
  end

  def fetch_post_comments(handle)
    ApiEmulator::SecondSiteApiEmulator.new.fetch_post_comments(handle)
  end
end