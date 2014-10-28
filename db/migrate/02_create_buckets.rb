class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.integer :kid_id
    end
  end
end