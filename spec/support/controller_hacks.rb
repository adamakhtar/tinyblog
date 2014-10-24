# "Borrowed" from Spree
module Tinyblog
  module ControllerHacks
    def get(action, parameters = nil, session = nil, flash = nil)
      process_tinyblog_action(action, parameters, session, flash, "GET")
    end

    # Executes a request simulating POST HTTP method and set/volley the response
    def post(action, parameters = nil, session = nil, flash = nil)
      process_tinyblog_action(action, parameters, session, flash, "POST")
    end

    # Executes a request simulating PUT HTTP method and set/volley the response
    def put(action, parameters = nil, session = nil, flash = nil)
      process_tinyblog_action(action, parameters, session, flash, "PUT")
    end

    # Executes a request simulating DELETE HTTP method and set/volley the response
    def delete(action, parameters = nil, session = nil, flash = nil)
      process_tinyblog_action(action, parameters, session, flash, "DELETE")
    end

    private

    def process_tinyblog_action(action, parameters = nil, session = nil, flash = nil, method = "GET")
      parameters ||= {}
      process(action, method, parameters.merge!(:use_route => :tinyblog), session, flash)
    end
  end
end

RSpec.configure do |c|
  c.include Tinyblog::ControllerHacks, :type => :controller
end