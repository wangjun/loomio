class RemoveDoubleIndexFromComments < ActiveRecord::Migration
  def change
    remove_index :comments, name: "index_comments_on_commentable_id"
  end
end
