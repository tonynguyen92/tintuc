class CreateTobaos < ActiveRecord::Migration
  def change
    create_table :tobaos do |t|
      t.string :name
      t.timestamps
    end
  end
end
