class ExternalApi
  class SecondSiteApi < ExternalApi
    private

    def source_presentation_file
      [Rails.root, 'config', 'second_site_data.yml'].join('/')
    end
  end
end