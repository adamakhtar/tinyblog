require 'spec_helper'

module Tinyblog
  describe Post do
    it "sets published_at on save" do
      create(:post).published_at.should be_kind_of Time
    end
  end
end
