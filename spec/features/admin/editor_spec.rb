require 'spec_helper'

feature 'Blog admin' do

  let!(:user){ create(:user, :admin => true) }

  before do
    sign_in user
  end

  scenario 'edit a post' do
    post = create(:post)

    visit admin_post_path(post)

    click_link I18n.t('tinyblog.posts.edit')

    fill_in 'post_title', :with => 'Edited title'

    click_button I18n.t('tinyblog.ui.save')

    post.reload # new title creates new slug
    
    page.current_path.should == edit_admin_editor_path(post)

    flash_success!(I18n.t('tinyblog.posts.updated'))

    page.should have_field 'post_title', with: 'Edited title'
  end

end