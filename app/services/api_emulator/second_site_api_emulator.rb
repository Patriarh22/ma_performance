class ApiEmulator
  class SecondSiteApiEmulator < ApiEmulator
    private

    def source_presentation_file
      [Rails.root, 'data', 'second_site_data.yml'].join('/')
    end
  end
end