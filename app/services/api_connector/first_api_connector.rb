class ApiConnector
  class FirstApiConnector < ApiConnector
    private

    def connection
      @connection ||= ApiEmulator::FirstApiEmulator.new
    end
  end
end
