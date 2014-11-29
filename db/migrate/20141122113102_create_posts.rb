class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :desc
      t.text :content
      t.references :category , index: true 
      t.references :tobao , index: true 
      t.timestamps
    end
  end
end
