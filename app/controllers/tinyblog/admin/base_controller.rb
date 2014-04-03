module Tinyblog
  module Admin

    class BaseController < ApplicationController
      before_filter :authorize_tinyblog_admin!

      layout Tinyblog.admin_layout

      private

        def authorize_tinyblog_admin!
          if !tinyblog_admin_logged_in?
            flash[:warning] = t('tinyblog.errors.access_denied')
            redirect_to root_path 
          end
        end
    end
    
  end
end
