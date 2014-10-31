class AddAccessKeyToTinyblogPosts < ActiveRecord::Migration
  def change
    add_column :tinyblog_posts, :access_key, :string
  end
end
