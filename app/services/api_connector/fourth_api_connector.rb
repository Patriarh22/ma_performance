class ApiConnector
  class FourthApiConnector < ApiConnector
    private

    def connection
      ApiEmulator::FourthApiEmulator.new
    end
  end
end
