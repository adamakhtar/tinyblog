module Tinyblog
  class ApplicationController < ::ApplicationController

    layout Tinyblog.layout

    def tinyblog_admin_logged_in?
      tinyblog_user and tinyblog_user.tinyblog_admin?
    end
    helper_method :tinyblog_admin_logged_in?
    
  end
end
