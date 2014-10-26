require 'spec_helper'

feature 'Blog admin' do

  let!(:user){ create(:user, :admin => true) }

  before do
    sign_in user
  end


  scenario 'creates a post' do
    author = create(:author, :first_name => "Bart", :last_name => "Simpson")

    visit admin_posts_path
    click_link I18n.t('tinyblog.posts.new')

    page.current_path.should == edit_admin_post_path(Tinyblog::Post.last)
  end

  scenario 'updates a posts author' do
    post = create(:post)
    new_author = create(:author, :first_name => "Michael", :last_name => "Jackson")

    visit admin_post_path(post)

    select new_author.short_fullname, from: 'post_author_id'

    click_button I18n.t('tinyblog.posts.update_author')

    page.current_path.should == admin_post_path(post)

    flash_success!(I18n.t('tinyblog.posts.updated'))
    page.should have_select('post_author_id', selected: new_author.short_fullname)
  end


  scenario 'edit a post' do
    post = create(:post)

    visit admin_post_path(post)

    click_link I18n.t('tinyblog.posts.edit')

    fill_in 'post_title', :with => 'Edited title'

    click_button I18n.t('tinyblog.ui.save')

    post.reload

    page.current_path.should == admin_post_path(post)

    flash_success!(I18n.t('tinyblog.posts.updated'))

    page.should have_content 'Edited title'
  end

  scenario 'delete a post' do
    post = create(:post)

    visit admin_posts_path()

    within(selector_for(:first_post)) do
      click_link I18n.t('tinyblog.ui.delete')
    end
    
    flash_success!(I18n.t('tinyblog.posts.deleted'))

    page.current_path.should == admin_posts_path
  end

  scenario 'listing deleted' do
    post = create(:post)
    post.destroy

    visit admin_posts_path()

    click_link 'Trash'

    assert_seen!(post.title, within: selector_for(:first_post))
  end

  scenario 'undeleting a post' do
    post = create(:post)
    post.destroy

    visit admin_posts_path()

    click_link 'Trash'

    click_link I18n.t('tinyblog.ui.restore')

    flash_success!(I18n.t('tinyblog.posts.restored'))
    click_link 'All'
    page.should have_content post.title
  end
end