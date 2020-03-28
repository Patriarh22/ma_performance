class MoveSyncDateFromSourceToPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :sources, :sync_date, :timestamp
    add_column :posts, :sync_date, :timestamp
  end
end
