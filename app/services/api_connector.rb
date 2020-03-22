class ApiConnector
  def fetch_all_posts
    connection&.fetch_all_posts
  end

  def fetch_post_comments(handle)
    connection&.fetch_post_comments(handle)
  end

  private

  def connection; end
end