require 'spec_helper'

feature 'Posts' do
  scenario 'lists latest posts' do
    post_a = create(:post, :created_at => 1.day.ago)
    post_b = create(:post, :created_at => 2.days.ago)

    visit root_path

    page.should have_content post_a.title, :within => selector_for(:first_post)
    page.should have_content post_b.title, :within => selector_for(:second_post)
  end

  scenario 'shows a post' do
    post = create(:post)

    visit post_path(post)
    page.should have_content post.title
    page.should have_content post.body
  end
end