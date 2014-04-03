module Tinyblog
  class Author < ActiveRecord::Base
    has_many :posts

    def fullname
      "#{first_name} #{last_name}"
    end
  end
end
