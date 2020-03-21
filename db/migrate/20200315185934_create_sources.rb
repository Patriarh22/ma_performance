class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :connector
      t.timestamp :sync_date

      t.timestamps
    end
  end
end
