class ApiConnector
  class ThirdApiConnector < ApiConnector
    private

    def connection
      ApiEmulator::ThirdApiEmulator.new
    end
  end
end
