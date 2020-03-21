class FirstSiteConnector
  def fetch_all_posts
    ExternalApi::FirstSiteApi.new.fetch_all_posts
  end

  def fetch_post_comments(handle)
    ExternalApi::FirstSiteApi.new.fetch_post_comments(handle)
  end
end