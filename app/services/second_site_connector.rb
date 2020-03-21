class SecondSiteConnector
  def fetch_posts
    ExternalApi::SecondSiteApi.new.fetch_all_posts
  end

  def fetch_comments(handle)
    ExternalApi::SecondSiteApi.new.fetch_post_comments(handle)
  end
end