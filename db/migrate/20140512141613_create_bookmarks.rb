class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.integer :category_id

      t.timestamps
    end
    add_index :bookmarks, :category_id
  end
end
