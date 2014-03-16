class AddAuthorToPosts < ActiveRecord::Migration
  def change
    add_column :tinyblog_posts, :author_id, :integer
  end
end
