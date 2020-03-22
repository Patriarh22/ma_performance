class ApiEmulator
  class SecondSiteApiEmulator < ApiEmulator
    private

    def source_presentation_file
      [Rails.root, 'config', 'second_site_data.yml'].join('/')
    end
  end
end