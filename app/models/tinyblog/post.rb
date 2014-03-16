module Tinyblog
  class Post < ActiveRecord::Base
    belongs_to :author
  end
end
