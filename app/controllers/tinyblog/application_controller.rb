module Tinyblog
  class ApplicationController < ::ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :redirect_not_found
    
    layout Tinyblog.layout

    private

    def tinyblog_admin_logged_in?
      tinyblog_user and tinyblog_user.tinyblog_admin?
    end
    helper_method :tinyblog_admin_logged_in?

    def redirect_not_found
      redirect_to posts_path
    end
    
  end
end
