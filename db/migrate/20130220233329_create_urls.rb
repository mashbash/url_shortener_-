class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text    :long_url
      t.string  :short_url
      t.integer :counter, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
