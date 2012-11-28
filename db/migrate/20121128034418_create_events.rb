class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :uniq_id, :unique => true
      t.string :type
      t.integer:author_id
      t.text   :data
      t.datetime :github_created_at
      t.timestamps
    end
    add_index :events,:uniq_id
  end
end
