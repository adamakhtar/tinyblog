require 'spec_helper'

feature 'Admin' do 
  scenario 'requires authentication' do
    visit admin_root_path
    flash_warning!(I18n.t('tinyblog.errors.access_denied'))
    page.current_path.should == root_path
  end
end