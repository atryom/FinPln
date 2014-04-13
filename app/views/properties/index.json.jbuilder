json.array!(@properties) do |property|
  json.extract! property, :id, :user_id, :need_4_good, :bottleneck
  json.url property_url(property, format: :json)
end
