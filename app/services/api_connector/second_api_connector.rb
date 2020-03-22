class ApiConnector
  class SecondApiConnector < ApiConnector
    private

    def connection
      ApiEmulator::SecondApiEmulator.new
    end
  end
end
