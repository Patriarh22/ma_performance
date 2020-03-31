class AddMissingIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :source_id
    add_index :comments, :post_id
    add_index :posts, %i[source_id status]
    add_index :posts, %i[source_id handle]
  end
end
