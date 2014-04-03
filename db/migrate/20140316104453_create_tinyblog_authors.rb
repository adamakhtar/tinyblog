class CreateTinyblogAuthors < ActiveRecord::Migration
  def change
    create_table :tinyblog_authors do |t|
      t.string :first_name
      t.string :last_name
      t.text   :bio
      t.string :twitter
      t.string :gplus
      t.string :facebook

      t.timestamps
    end
  end
end
