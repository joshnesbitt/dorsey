module Dorsey
  module TemplateSupport

    def erb(name, locals = {}, options = {})
      rendered = Template.new(locals).render(lookup_template(name).read)

      if options.fetch(:layout, true)
        layout = Template.new(locals.merge(content: rendered)).render(lookup_template('layout').read)
      else
        rendered
      end
    end

    def partial(name, locals = {})
      erb("_#{name}", locals, layout: false)
    end

    def lookup_template(path)
      Pathname.new(Dorsey.root.join('views', "#{path}.erb"))
    end

  end
end
