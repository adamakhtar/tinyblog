require 'spec_helper'

describe Tinyblog::PostsController do

  context "#show" do
    it "shows drafts to admin" do
      admin = create(:user, :admin)
      sign_in admin
      post = create(:post, :drafting)
      get :show, id: post.id
      response.should be_success
    end

    it "does not show drafts to guests" do
      post = create(:post, :drafting)
      get :show, id: post.id
      response.should be_redirect
    end
  end
end