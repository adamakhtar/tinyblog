module Tinyblog
  class Author < ActiveRecord::Base
    has_many :posts

    def fullname
      "#{first_name} #{last_name}"
    end

    def short_fullname 
      "#{first_name} #{last_name[0]}."
    end
  end
end
