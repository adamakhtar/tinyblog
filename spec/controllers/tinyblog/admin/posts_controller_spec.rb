require 'spec_helper'

describe Tinyblog::Admin::PostsController do

  let(:admin){ create(:user, :admin) }

  context "as admin" do
    
    before do
      sign_in admin
    end

    context "get #index" do

      let!(:published) { create :post, :published }
      let!(:drafting)  { create :post, :drafting }
      let!(:trashed)   { create :post, :trashed }

      it "shows all active" do
        get :index
        assigns(:posts).should include published
        assigns(:posts).should include drafting
        assigns(:posts).should_not include trashed
      end
 
      it "filters published" do
        get :index, 
            tab: 'Published'


        assigns(:posts).should == [published]
        response.should be_success
      end

      it "filters drafts" do
        get :index, 
            tab: 'Draft'

        assigns(:posts).should == [drafting]
        response.should be_success
      end

      it "filters trashed" do
        get :index, 
            tab: 'Trash'

        assigns(:posts).should == [trashed]
        response.should be_success
      end
    end
  end
end