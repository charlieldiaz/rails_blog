class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :img_url
      t.string :slug
      t.integer :category_id
      t.boolean :featured


      t.timestamps
    end
  end
end
