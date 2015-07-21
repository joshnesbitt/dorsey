require 'erb'
require 'ostruct'

module Dorsey

  def self.root
    @root ||= Pathname.new(File.expand_path("../../", __FILE__))
  end

  autoload :App, root.join('lib/dorsey/app')
  autoload :Router, root.join('lib/dorsey/router')
  autoload :Request, root.join('lib/dorsey/request')
  autoload :Template, root.join('lib/dorsey/template')
  autoload :TemplateSupport, root.join('lib/dorsey/template_support')

end
