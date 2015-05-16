json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :first_name, :middle_name, :last_name, :contact_no, :email, :area, :subject, :last_seen_date, :description
  json.url complaint_url(complaint, format: :json)
end
