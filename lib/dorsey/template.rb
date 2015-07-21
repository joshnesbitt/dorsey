module Dorsey
  class Template < OpenStruct
    include TemplateSupport

    def render(template)
      ERB.new(template).result(binding)
    end
  end
end
