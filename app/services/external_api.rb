class ExternalApi
  def fetch_all_posts
    sleep 1
    fetch_source_posts.compact
  end

  def fetch_post_comments(handle)
    sleep 1
    post = source_data.find { |post| post.respond_to?(:[]) && post[:handle] == handle }
    return [] if post.blank?
    post[:comments].to_a.map(&:symbolize_keys)
  end

  private

  def fetch_source_posts
    source_data.map do |post|
      next unless post.respond_to?(:slice)
      post.slice(:handle, :title, :body, :author)
    end
  end

  def source_data
    data = YAML.load_file(source_presentation_file)
    data.map(&:symbolize_keys)
  rescue Errno::ENOENT => _
    []
  end

  def source_presentation_file; end
end