module Dorsey
  class Router
    attr_accessor :not_found

    DEFAULT_MAP = {
      get: {},
      post: {},
      put: {},
      patch: {},
      delete: {}
    }

    def initialize
      @map = DEFAULT_MAP.dup
    end

    def add(method, key, &block)
      @map[method.to_sym][key] = block
    end

    def match(method, path)
      @map[method.to_sym][path]
    end
  end
end
