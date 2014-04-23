require 'spec_helper'

feature 'Adminstrating authors' do 

  before do
    user = create(:user, :admin => true)
    sign_in user
  end

  scenario 'list authors' do
    author_a = create(:author)
    author_b = create(:author)

    visit admin_authors_path

    page.should have_content author_a.fullname
    page.should have_content author_b.fullname
  end

  scenario 'creates an author' do
    visit new_admin_author_path

    fill_in 'First name', :with => "Buggs"
    fill_in 'Last name',  :with => "Bunny"
    click_button 'Save'

    page.current_path.should == admin_authors_path
    flash_success!(I18n.t('tinyblog.authors.created'))
    page.should have_content 'Buggs Bunny'
  end

  scenario 'edits an author' do
    author = create(:author)

    visit edit_admin_author_path(author)

    fill_in 'First name', :with => "Pamela"
    fill_in 'Last name',  :with => "Anderson"
    click_button 'Update'

    page.current_path.should == admin_authors_path
    flash_success!(I18n.t('tinyblog.authors.updated'))
    page.should have_content "Pamela Anderson"
  end
  
end