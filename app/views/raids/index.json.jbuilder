json.array!(@raids) do |raid|
  json.extract! raid, :id, :title, :date, :time, :location_id
  json.url raid_url(raid, format: :json)
end
