class ApiEmulator
  class FirstSiteApiEmulator < ApiEmulator
    private

    def source_presentation_file
      [Rails.root, 'data', 'first_site_data.yml'].join('/')
    end
  end
end