class AddPublishedAtToPosts < ActiveRecord::Migration
  def change
    add_column :tinyblog_posts, :published_at, :datetime
  end
end
