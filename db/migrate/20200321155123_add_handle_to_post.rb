class AddHandleToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :handle, :string
  end
end
