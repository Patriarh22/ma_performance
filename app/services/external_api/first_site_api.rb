class ExternalApi
  class FirstSiteApi < ExternalApi
    private

    def source_presentation_file
      [Rails.root, 'config', 'first_site_data.yml'].join('/')
    end
  end
end