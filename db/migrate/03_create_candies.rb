class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.integer :house_id
      t.integer :bucket_id
      t.string :name
      t.integer :size
      t.integer :pieces
    end
  end
end