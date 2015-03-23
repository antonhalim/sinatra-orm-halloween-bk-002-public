class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.string :feeling
      t.integer :age

      t.timestamps null: false
    end
  end
end
