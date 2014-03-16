module Tinyblog
  module Admin

    class BaseController < ApplicationController
      before_filter :authorize_tinyblog_admin!

      private

        def authorize_tinyblog_admin!
          if !tinyblog_user or !tinyblog_user.tinyblog_admin?
            flash[:warning] = t('tinyblog.errors.access_denied')
            redirect_to root_path 
          end
        end
    end
    
  end
end
