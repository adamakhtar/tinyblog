require_dependency "tinyblog/application_controller"

module Tinyblog
  module Admin
    module Posts
      class StatusController < BaseController

        def update
          @post = Post.find(params[:post_id])
          case params[:status]
          when 'drafting' then @post.draft!
          when 'published' then @post.publish!
          end

          redirect_to admin_post_path(@post)
        end

        


        
      end
    end
  end
end
