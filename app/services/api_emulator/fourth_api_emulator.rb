class ApiEmulator
  class FourthApiEmulator < ApiEmulator
    private

    def source_presentation_file
      [Rails.root, 'data', 'fourth_site_data.yml'].join('/')
    end
  end
end