class ApiEmulator
  class ThirdApiEmulator < ApiEmulator
    private

    def source_presentation_file
      [Rails.root, 'data', 'third_site_data.yml'].join('/')
    end
  end
end