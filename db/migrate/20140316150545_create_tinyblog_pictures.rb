class CreateTinyblogPictures < ActiveRecord::Migration
  def change
    create_table :tinyblog_pictures do |t|
      t.string :data

      t.timestamps
    end
  end
end
