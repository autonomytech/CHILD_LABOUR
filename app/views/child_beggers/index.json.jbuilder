json.array!(@child_labours) do |child_labour|
  json.extract! child_labour, :id, :name, :father_name, :mother_name, :address, :age, :employer_id, :raid_id, :description, :is_deleted
  json.url child_labour_url(child_labour, format: :json)
end
