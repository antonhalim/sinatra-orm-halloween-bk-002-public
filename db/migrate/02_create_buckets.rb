class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.belongs_to :kid, index: true

      t.timestamps null: false
    end
  end
end
