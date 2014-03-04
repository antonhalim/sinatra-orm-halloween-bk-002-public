Sequel.migration do
  change do
    add_column :kids, :age, Integer
  end
end
