class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.string :name
      t.integer :size
      t.integer :pieces
      t.belongs_to :house, index: true
      t.belongs_to :bucket, index: true

      t.timestamps null: false
    end
  end
end
