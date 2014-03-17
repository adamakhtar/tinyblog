require 'carrierwave'
module Tinyblog
  class Engine < ::Rails::Engine
    isolate_namespace Tinyblog

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false , :controller_specs => false
    end
  end
end

require 'simple_form'