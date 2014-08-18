class AddDeletedAtToTinyblogPosts < ActiveRecord::Migration
  def change
    add_column :tinyblog_posts, :deleted_at, :datetime
    add_index :tinyblog_posts, :deleted_at
  end
end
