json.array!(@employers) do |employer|
  json.extract! employer, :id, :first_name, :middle_name, :last_name, :address, :contact_no, :is_deleted
  json.url employer_url(employer, format: :json)
end
