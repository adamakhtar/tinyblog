require 'spec_helper'

feature 'Posts' do
  scenario 'lists latest posts' do
    post_a = create(:post, :created_at => 1.day.ago)
    post_b = create(:post, :created_at => 2.days.ago)

    visit tinyblog.root_path

    page.should have_content post_a.title, :within => selector_for(:first_post)
    page.should have_content post_b.title, :within => selector_for(:second_post)
  end

  scenario 'shows a post' do
    post = create(:post)

    visit tinyblog.post_path(post)
    page.should have_content post.title
    page.should have_content post.body
  end

  scenario 'create a post' do
    visit tinyblog.new_post_path

    fill_in 'Title', :with => 'Cute cats'
    fill_in 'Body',  :with => 'I love cats'

    click_button 'Publish'

    page.current_path.should == tinyblog.posts_path

    flash_success!(I18n.t('tinyblog.posts.created'))

    page.should have_content 'Cute cats'
    page.should have_content 'I love cats'

  end
end