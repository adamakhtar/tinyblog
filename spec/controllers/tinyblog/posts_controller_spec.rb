require 'spec_helper'

describe Tinyblog::PostsController do

  context "#show" do

    before do
      controller.stub(:redirect_old_slugs)
    end

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
        response.should redirect_to posts_path
      end

      it "redirects old slugs" do
        controller.unstub(:redirect_old_slugs)
        post = create(:post, :published, title: 'oldslug')
        post.update_attributes(title: 'newslug')
        get :show, id: 'oldslug'
        response.status.should == 301
        response.should redirect_to post_path(id: 'newslug')
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