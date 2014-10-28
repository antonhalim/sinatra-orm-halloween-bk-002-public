class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.string :feeling
    end
  end
end