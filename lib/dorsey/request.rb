module Dorsey
  class Request

    def initialize(env = {})
      @env = env
    end

    def method
      @env['REQUEST_METHOD']
    end

    def path
      @env['PATH_INFO']
    end

    def extension
      path.include?('.') ? path.split('.').last : nil
    end

  end
end
