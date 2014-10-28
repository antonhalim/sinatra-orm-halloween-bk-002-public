class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.string :name
      t.integer :size
      t.integer :bucket_id
      t.integer :house_id
      t.integer :pieces
    end
  end
end