class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :tinyblog_posts, :slug, :string
    add_index  :tinyblog_posts, :slug, unique: true
  end
end
