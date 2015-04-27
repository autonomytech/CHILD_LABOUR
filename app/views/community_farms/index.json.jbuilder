json.array!(@community_farms) do |community_farm|
  json.extract! community_farm, :id, :raid_id, :department_id, :involve_member, :string
  json.url community_farm_url(community_farm, format: :json)
end
