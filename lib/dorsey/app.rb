module Dorsey
  class App
    class << self
      include Dorsey::TemplateSupport

      def router
        @router ||= Router.new
      end

      def get(path, &block)
        router.add(:get, path, &block)
      end

      def not_found(&block)
        router.not_found = block
      end
    end

    def call(env = {})
      request = Request.new(env)
      router = self.class.router
      route = router.match(request.method.downcase, request.path)
      response = if route
                   route.call(request)
                 else
                   if router.not_found
                     router.not_found.call(request)
                   else
                     '404 not found.'
                   end
                 end

      render(response)
    end

    def render(body, options = {})
      [
        options.fetch(:status, 200),
        options.fetch(:headers, { 'Content-Type' => 'text/html' }),
        [ body ]
      ]
    end
  end
end
