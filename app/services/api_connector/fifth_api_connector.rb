class ApiConnector
  class FifthApiConnector < ApiConnector
    private

    def connection
      ApiEmulator::FifthApiEmulator.new
    end
  end
end
