class AddWorkflowStateToTinyblogPosts < ActiveRecord::Migration
  def up
    add_column :tinyblog_posts, :workflow_state, :string
    add_index :tinyblog_posts, :workflow_state

    Tinyblog::Post.only_deleted.each do |p|
      p.retract!
    end

    Tinyblog::Post.all.each do |p|
      p.publish!
    end
  end

  def down
    remove_column :tinyblog_posts, :workflow_state
    remove_index :tinyblog_posts, :workflow_state
  end
end
