Sequel.migration do
  change do
    create_table(:buckets) do
      primary_key :id
      foreign_key :kid_id, :kids
    end
  end
end
