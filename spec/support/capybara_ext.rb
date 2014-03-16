module CapybaraExt

  def selector_for(identifier)
    case identifier
    when :first_post
      "#posts #post_1"
    when :second_post
      "#posts #post_2"
    else
      pending "no selector defined yet for #{identifier} - define one in support/capybara_ext.rb"
    end
  end
end

RSpec.configure do |config|
  config.include CapybaraExt, :type => :feature
end