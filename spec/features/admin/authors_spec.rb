require 'spec_helper'

feature 'Adminstrating authors' do 

  scenario 'list authors' do
    author_a = create(:author)
    author_b = create(:author)

    visit admin_authors_path

    page.should have_content author_a.fullname
    page.should have_content author_b.fullname

  end
  
end