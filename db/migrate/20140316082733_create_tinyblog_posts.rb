class CreateTinyblogPosts < ActiveRecord::Migration
  def change
    create_table :tinyblog_posts do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
