class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |h|
      h.text :address
      h.timestamp
    end
  end
end
