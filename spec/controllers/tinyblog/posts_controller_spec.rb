require 'spec_helper'

describe Tinyblog::PostsController do

  context "#show" do

    context "as admin" do
      let(:admin) { create(:user, :admin) }

      before do 
        sign_in admin
      end

      it "shows drafts" do
        post = create(:post, :drafting)
        get :show, id: post.id
        response.should be_success
      end

      it "does not increment the view count" do
        post = create(:post, :published)
        post.view_count.should == 0
        get :show, id: post.id
        post.reload
        post.view_count.should == 0
      end
    end

    context "as visitor" do
      it "does not show drafts" do
        post = create(:post, :drafting)
        get :show, id: post.id
        response.should be_redirect
      end

      it "increments the view count" do
        post = create(:post, :published)
        post.view_count.should == 0
        get :show, id: post.id
        post.reload
        post.view_count.should == 1
      end
    end
  end
end