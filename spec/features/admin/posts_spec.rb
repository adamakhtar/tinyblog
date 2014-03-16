require 'spec_helper'

feature 'Blog admin' do

  let!(:user){ create(:user, :admin => true) }

  before do
    sign_in user
  end


  scenario 'create a post' do
    author = create(:author, :first_name => "Bart", :last_name => "Simpson")

    visit new_admin_post_path

    fill_in 'Title', :with => 'Cute cats'
    fill_in 'Body',  :with => 'I love cats'
    select  'Bart Simpson', :from => 'Author'

    click_button 'Publish'

    page.current_path.should == admin_posts_path

    flash_success!(I18n.t('tinyblog.posts.created'))

    page.should have_content 'Cute cats'
  end


  scenario 'edit a post' do
    post = create(:post_with_author)

    visit edit_admin_post_path(post)

    fill_in 'Title', :with => 'Edited title'

    click_button 'Update'

    page.current_path.should == admin_posts_path

    flash_success!(I18n.t('tinyblog.posts.updated'))

    page.should have_content 'Edited title'
  end
end