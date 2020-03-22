class ApiEmulator
  class FifthSiteApiEmulator < ApiEmulator
    private

    def source_presentation_file
      [Rails.root, 'data', 'fifth_site_data.yml'].join('/')
    end
  end
end