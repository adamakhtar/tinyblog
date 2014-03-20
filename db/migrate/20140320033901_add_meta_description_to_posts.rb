class AddMetaDescriptionToPosts < ActiveRecord::Migration
  def change
    add_column :tinyblog_posts, :meta_description, :text
  end
end
