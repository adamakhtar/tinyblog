require 'spec_helper'

feature 'Blog admin' do
  scenario 'create a post' do
    visit new_admin_post_path

    fill_in 'Title', :with => 'Cute cats'
    fill_in 'Body',  :with => 'I love cats'

    click_button 'Publish'

    page.current_path.should == admin_posts_path

    flash_success!(I18n.t('tinyblog.posts.created'))

    page.should have_content 'Cute cats'
    page.should have_content 'I love cats'
  end
end