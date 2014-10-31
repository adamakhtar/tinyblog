require 'spec_helper'

module Tinyblog
  describe Post do
    it "sets published_at on initialize" do
      Post.new.published_at.should be_kind_of Time
    end

    it "sets access key on initialize" do
      Post.new.access_key.size.should == 6
    end
  end
end
