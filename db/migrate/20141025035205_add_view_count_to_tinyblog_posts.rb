class AddViewCountToTinyblogPosts < ActiveRecord::Migration
  def change
    add_column :tinyblog_posts, :view_count, :integer, default: 0
  end
end
