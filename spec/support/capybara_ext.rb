module CapybaraExt

  def flash_success!(msg)
    within("#flash_success") do 
      page.should have_content msg
    end
  end

  def flash_warning!(msg)
    within("#flash_warning") do 
      page.should have_content msg
    end
  end

  # Just shorter to type.
  def page!
    save_and_open_page
  end

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

  #shorter way to write it
  def assert_seen!(str, opts={})
    if opts[:within].present?
      within(opts[:within]) do
        page.should have_content str
      end
    else
      page.should have_content str
    end
  end

  def meta_description_present!(description)
    page.should have_css %Q{meta[content="#{description}"]}, :visible => false
  end
end

RSpec.configure do |config|
  config.include CapybaraExt, :type => :feature
end